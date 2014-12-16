require "rails_helper"

feature "Treatment types" do
  let!(:group) { create(:treatment_types_group, name: "Test group") }
  let!(:group_2) { create(:treatment_types_group, name: "Test group 2") }
  let!(:treatment_type) { create(:treatment_type, treatment_types_group: group) }

  feature "Create" do
    scenario "Should create new treatment type" do
      visit treatment_types_path
      click_link t('treatment_types.index.new_treatment_type')
      fill_in t('activerecord.attributes.treatment_type.name'), with: "Treatment type name"
      select 'Test group', from: t('activerecord.attributes.treatment_type.treatment_types_group')
      click_button t('submit')

      expect(page).to have_text(t('treatment_types.created'))
      expect(page).to have_content("Test group")
      expect(page).to have_content("Treatment type name")
    end
  end

  feature "Update" do
    scenario "Should update existing treatment type" do
      visit treatment_types_path
      click_link t('treatment_types.treatment_type.edit_treatment_type')
      fill_in t('activerecord.attributes.treatment_type.name'), with: "Updated treatment type name"
      select 'Test group 2', from: t('activerecord.attributes.treatment_type.treatment_types_group')
      click_button t('submit')

      expect(page).to have_text(t('treatment_types.updated'))
      expect(page).to have_content("Test group 2")
      expect(page).to have_content("Updated treatment type name")
    end
  end

  feature "Deleting doctor that not have any associated records" do
    scenario "Should delete existing Doctor" do
      visit treatment_types_path
      click_link t('treatment_types.treatment_type.destroy_treatment_type')

      expect(page).to have_text(t('treatment_types.destroyed'))
    end
  end
end