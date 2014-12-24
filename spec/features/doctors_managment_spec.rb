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
      fill_address_fields("Test street", "Test city", "12-345")
      select 'Test ordering unit', from: t('activerecord.attributes.doctor.ordering_unit')
      click_button t('submit')

      expect(page).to have_text(t('doctors.created'))
      expect(page).to have_content("Fullname")
      expect(page).to have_content("Specialization")
      expect(page).to have_content("Test street, 12-345 Test city")
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
      fill_address_fields("Updated street", "Updated city", "12-345")
      click_button t('submit')

      expect(page).to have_text(t('doctors.updated'))
      expect(page).to have_content("Updated Fullname")
      expect(page).to have_content("Updated Specialization")
      expect(page).to have_content("Updated street, 12-345 Updated city")
      expect(page).to have_content("Test ordering unit")
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
    end
  end

  feature "Searching" do
    scenario "Should find proper doctors", js: true do
      fill_in "search_form_query", with: "Test"
      expect(page).to have_text(doctor2.fullname)
      expect(page).to_not have_text(doctor.fullname)
    end
  end
end