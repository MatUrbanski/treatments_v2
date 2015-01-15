require "rails_helper"

feature "Treatments" do
  let!(:patient) { create(:patient) }
  let!(:patient2) { create(:patient) }
  let!(:doctor) { create(:doctor) }
  let!(:doctor2) { create(:doctor) }
  let!(:treatment_type) { create(:treatment_type) }
  let!(:treatment_type2) { create(:treatment_type) }
  let!(:visitation_time) { create(:visitation_time) }
  let!(:old_visitation_time) { create(:visitation_time, day: 3.months.ago) }
  let!(:treatment) { create(:treatment) }
  let!(:treatment2) { create(:treatment, patient: patient2) }
  before { visit treatments_path }

  feature "Create" do
    before do
      click_link t('treatments.index.new_treatment')
    end

    scenario "should create new treatment", js: true do
      fill_autocomplete(t('activerecord.attributes.treatment.patient_find'),  with: patient.fullname)
      choose(doctor.fullname_with_specialization)
      choose(treatment_type.name_with_group_name)
      check(visitation_time.day_with_time_of_day)
      click_button t('submit')

      expect(page).to have_content patient.fullname_with_pesel
      expect(page).to have_content doctor.fullname_with_specialization
      expect(page).to have_content treatment_type.name
    end

    scenario "should not create new treatment with invalid attributes" do
      click_button t('submit')

      expect(page).to_not have_text(t('treatments.create.created'))
      expect(current_path).to eq treatments_path
    end
  end

  feature "Create with start_days other than default" do
    before do
      click_link t('treatments.index.new_treatment')
      click_link t('treatments.start_days.180_days')
    end

    scenario "should create new treatment", js: true do
      fill_autocomplete(t('activerecord.attributes.treatment.patient_find'),  with: patient.fullname)
      choose(doctor.fullname_with_specialization)
      choose(treatment_type.name_with_group_name)
      check(old_visitation_time.day_with_time_of_day)
      click_button t('submit')

      expect(page).to have_content patient.fullname_with_pesel
      expect(page).to have_content doctor.fullname_with_specialization
      expect(page).to have_content treatment_type.name
    end

    scenario "should not create new treatment with invalid attributes" do
      click_button t('submit')

      expect(page).to_not have_text(t('treatments.create.created'))
      expect(current_path).to eq treatments_path
    end
  end

  feature "Update" do
    before do
      find('.btn', match: :first).click
      click_link t('treatments.treatment.edit_treatment'), match: :first
    end

    scenario "should update existing Treatment", js: true do
      find('.change_patient').click
      fill_autocomplete(t('activerecord.attributes.treatment.patient_find'),  with: patient2.fullname)
      choose(doctor2.fullname_with_specialization)
      choose(treatment_type2.name_with_group_name)
      first(:button, t('submit')).click

      expect(page).to have_text(t('treatments.update.updated'))
      expect(page).to have_content patient2.fullname_with_pesel
      expect(page).to have_content doctor2.fullname_with_specialization
      expect(page).to have_content treatment_type2.name
    end

    scenario "should not update existing Treatment", js: true do
      find('.change_patient').click
      click_button t('submit')

      expect(page).to_not have_text(t('treatments.update.updated'))
      expect(current_path).to eq treatment_path(treatment)
    end
  end

  feature "Deleting treatment" do
    scenario "should delete existing treatment" do
      click_link t('treatments.treatment.destroy_treatment'), match: :first

      expect(page).to have_text(t('treatments.destroy.destroyed'))
    end
  end

  feature "Searching" do
    scenario "should find proper treatments", js: true do
      fill_in "search_form_query", with: treatment.patient.pesel
      expect(page).to have_text(treatment.patient_fullname_with_pesel)
      expect(page).to_not have_text(treatment2.patient_fullname_with_pesel)
    end
  end
end