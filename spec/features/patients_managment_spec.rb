require "rails_helper"

feature "Patients" do
  let!(:patient) { create(:patient, :male, fullname: "Patient", pesel: "12345678901") }
  let!(:patient2) { create(:patient, :male, fullname: "Test patient", pesel: "09876543211") }
  before { visit patients_path }

  feature "Create" do
    before do
      click_link t('patients.index.new_patient')
    end

    scenario "should create new patient" do
      fill_in t('activerecord.attributes.patient.fullname'),   with: "Fullname"
      fill_in t('activerecord.attributes.patient.pesel'),      with: "12345678902"
      select t('sex.male'), from: t('activerecord.attributes.patient.sex')
      fill_in t('activerecord.attributes.patient.birth_date'), with: "1990-12-12"
      fill_address_fields("Test street", "Test city", "12-345")
      click_button t('submit')

      expect(page).to have_text(t('patients.created'))
      expect(page).to have_content("Fullname")
      expect(page).to have_content(t('sex.male'))
      expect(page).to have_content('12345678901')
      expect(page).to have_content("Test street, 12-345 Test city")
    end

    scenario "should create new patient without pesel" do
      fill_in t('activerecord.attributes.patient.fullname'),   with: "Fullname"
      page.check('patient_without_pesel')
      select t('sex.female'), from: t('activerecord.attributes.patient.sex')
      fill_in t('activerecord.attributes.patient.birth_date'), with: "1990-12-12"
      fill_address_fields("Test street", "Test city", "12-345")
      click_button t('submit')

      expect(page).to have_text(t('patients.created'))
      expect(page).to have_content("Fullname")
      expect(page).to have_content(t('sex.female'))
      expect(page).to have_content(t('patients.pesel_alert'))
      expect(page).to have_content("Test street, 12-345 Test city")
    end

    scenario "should not create new patient with invalid attribtues" do
      click_button t('submit')

      expect(page).to_not have_text(t('patients.created'))
      expect(current_path).to eq patients_path
    end
  end

  feature "Update" do
    before do
      click_link t('patients.patient.edit_patient'), match: :first
    end

    scenario "should update patient" do
      fill_in t('activerecord.attributes.patient.fullname'),   with: "Updated Fullname"
      fill_in t('activerecord.attributes.patient.pesel'),      with: "09876543210"
      select t('sex.male'), from: t('activerecord.attributes.patient.sex')
      fill_in t('activerecord.attributes.patient.birth_date'), with: "1999-12-12"
      fill_address_fields("Updated street", "Updated city", "12-345")
      click_button t('submit')

      expect(page).to have_text(t('patients.updated'))
      expect(page).to have_content("Fullname")
      expect(page).to have_content(t('sex.male'))
      expect(page).to have_content('09876543210')
      expect(page).to have_content("Updated street, 12-345 Updated city")
    end

    scenario "should not update patient when attributes invalid" do
      fill_in t('activerecord.attributes.patient.fullname'), with: nil
      click_button t('submit')

      expect(page).to_not have_text(t('patients.updated'))
      expect(current_path).to eq patient_path(patient)
    end
  end

  feature "Delete" do
    scenario "Should delete existing patient" do
      visit patients_path
      click_link t('patients.patient.destroy_patient'), match: :first

      expect(page).to have_text(t('patients.destroyed'))
    end
  end

   feature "Searching" do
    scenario "Should find proper patients", js: true do
      fill_in "search_form_query", with: "Test"
      expect(page).to have_text(patient2.fullname)
      expect(page).to_not have_text(patient.fullname)
    end
  end
end