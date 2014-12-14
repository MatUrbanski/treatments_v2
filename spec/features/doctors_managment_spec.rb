require "rails_helper"

feature "Doctor management" do
  let(:ordering_unit) { build(:ordering_unit, name: "Test ordering unit") }
  let!(:doctor)  { create(:doctor, ordering_unit: ordering_unit)}

  scenario "Creating new Doctor" do
    visit doctors_path
    click_link t('doctors.index.new_doctor')
    fill_in t('activerecord.attributes.doctor.fullname'),       with: "Fullname"
    fill_in t('activerecord.attributes.doctor.specialization'), with: "Specialization"
    fill_in t('activerecord.attributes.address.street'),        with: "Test street"
    fill_in t('activerecord.attributes.address.city'),          with: "Test city"
    fill_in t('activerecord.attributes.address.zip_code'),      with: "12-345"
    select 'Test ordering unit', from: t('activerecord.attributes.doctor.ordering_unit')
    click_button t('submit')

    expect(page).to have_text(t('doctors.created'))
    expect(page).to have_content("Fullname")
    expect(page).to have_content("Specialization")
    expect(page).to have_content("Test street, 12-345 Test city")
    expect(page).to have_content("Test ordering unit")
  end

  scenario "Updating existing Doctor" do
    visit doctors_path
    click_link t('doctors.doctor.edit_doctor')
    fill_in t('activerecord.attributes.doctor.fullname'),       with: "Updated Fullname"
    fill_in t('activerecord.attributes.doctor.specialization'), with: "Updated Specialization"
    select 'Test ordering unit', from: t('activerecord.attributes.doctor.ordering_unit')
    fill_in t('activerecord.attributes.address.street'),        with: "Updated street"
    fill_in t('activerecord.attributes.address.city'),          with: "Updated city"
    fill_in t('activerecord.attributes.address.zip_code'),      with: "12-345"
    click_button t('submit')

    expect(page).to have_text(t('doctors.updated'))
    expect(page).to have_content("Updated Fullname")
    expect(page).to have_content("Updated Specialization")
    expect(page).to have_content("Updated street, 12-345 Updated city")
    expect(page).to have_content("Test ordering unit")
  end

  scenario "Deleting existing Doctor" do
    visit doctors_path
    click_link t('doctors.doctor.destroy_doctor')

    expect(page).to have_text(t('doctors.destroyed'))
  end
end