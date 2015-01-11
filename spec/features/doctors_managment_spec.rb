require "rails_helper"

feature "Doctors" do
  let(:ordering_unit) { build(:ordering_unit, name: "Test ordering unit") }
  let!(:doctor)  { create(:doctor, fullname: "Doctor", specialization: "Specialization", ordering_unit: ordering_unit)}
  let!(:doctor2) { create(:doctor, fullname: "Test doctort", specialization: "Test specialization") }
  before { visit doctors_path }

  feature "Create" do
    before do
      click_link t('doctors.index.new_doctor')
    end

    scenario "should create new doctor" do
      fill_in t('activerecord.attributes.doctor.fullname'),       with: "Fullname"
      fill_in t('activerecord.attributes.doctor.specialization'), with: "Specialization"
      select 'Test ordering unit', from: t('activerecord.attributes.doctor.ordering_unit')
      click_button t('submit')

      expect(page).to have_text(t('doctors.created'))
      expect(page).to have_content("Fullname")
      expect(page).to have_content("Specialization")
      expect(page).to have_content("Test ordering unit")
    end

    scenario "should not create new doctor" do
      click_button t('submit')

      expect(page).to_not have_text(t('doctors.created'))
      expect(current_path).to eq doctors_path
    end
  end

  feature "Update" do
    before do
      click_link t('doctors.doctor.edit_doctor'), match: :first
    end

    scenario "should update doctor" do
      fill_in t('activerecord.attributes.doctor.fullname'),       with: "Updated Fullname"
      fill_in t('activerecord.attributes.doctor.specialization'), with: "Updated Specialization"
      select 'Test ordering unit', from: t('activerecord.attributes.doctor.ordering_unit')
      click_button t('submit')
      doctor.reload

      expect(page).to have_text(t('doctors.updated'))
      expect(page).to have_content(doctor.fullname)
      expect(page).to have_content(doctor.specialization)
      expect(page).to have_content(doctor.ordering_unit_name)
    end

    scenario "should not update doctor" do
      fill_in t('activerecord.attributes.doctor.fullname'), with: nil
      click_button t('submit')

      expect(page).to_not have_text(t('doctors.updated'))
      expect(current_path).to eq doctor_path(doctor)
    end
  end

  feature "Deleting doctor that not have any associated records" do
    scenario "should delete existing Doctor" do
      click_link t('doctors.doctor.destroy_doctor'), match: :first

      expect(page).to have_text(t('doctors.destroyed'))
      expect(current_path).to eq doctors_path
    end
  end

  feature "Deleting doctor that have associated records" do
    before { create(:treatment, doctor: doctor) }
    scenario "should not delete existing Doctor" do
      click_link t('doctors.doctor.destroy_doctor'), match: :first

      expect(page).to have_text(t('.has_associated_records'))
      expect(current_path).to eq doctors_path
    end
  end

  feature "Searching" do
    scenario "should find proper doctors", js: true do
      fill_in "search_form_query", with: doctor.fullname

      expect(page).to have_text(doctor.fullname)
      expect(page).to_not have_text(doctor2.fullname)
    end
  end
end