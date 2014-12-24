require "rails_helper"

feature "Ordering units" do
  let!(:ordering_unit)  { create(:ordering_unit, name: "Ordering unit") }
  let!(:ordering_unit2)  { create(:ordering_unit, name: "Test ordering unit") }
  before { visit ordering_units_path }

  feature "Create" do
    before do
      click_link t('ordering_units.index.new_ordering_unit')
    end

    scenario "should create new ordering Unit" do
      fill_in t('activerecord.attributes.ordering_unit.name'),  with: "Ordering unit name"
      fill_address_fields("Test street", "Test city", "12-345")
      click_button t('submit')

      expect(page).to have_text(t('ordering_units.created'))
      expect(page).to have_content("Ordering unit name")
      expect(page).to have_content("Test street, 12-345 Test city")
    end

    scenario "should not create new ordering Unit" do
      click_button t('submit')

      expect(page).to_not have_text(t('ordering_units.created'))
      expect(current_path).to eq ordering_units_path
    end
  end

  feature "Update" do
    before do
      click_link t('ordering_units.ordering_unit.edit_ordering_unit'), match: :first
    end

    scenario "should update existing Ordering Unit" do
      fill_in t('activerecord.attributes.ordering_unit.name'), with: "Updated Ordering unit name"
      fill_address_fields("Updated street", "Updated city", "12-345")
      click_button t('submit')

      expect(page).to have_text(t('ordering_units.updated'))
      expect(page).to have_content("Updated Ordering unit name")
      expect(page).to have_content("Updated street, 12-345 Updated city")
    end

    scenario "should not update existing Ordering Unit" do
      fill_in t('activerecord.attributes.ordering_unit.name'), with: nil
      click_button t('submit')

      expect(page).to_not have_text(t('ordering_units.updated'))
      expect(current_path).to eq ordering_unit_path(ordering_unit)
    end
  end

  feature "Deleting ordering unit that not have any associated records" do
    before do
      click_link t('ordering_units.ordering_unit.destroy_ordering_unit'), match: :first
    end

    scenario "should delete existing ordering unit" do
      expect(page).to have_text(t('ordering_units.destroyed'))
    end
  end

  feature "Deleting ordering unit that have associated records" do
    let!(:doctor) { create(:doctor, ordering_unit: ordering_unit) }
    scenario "should not delete existing ordering unit" do
      click_link t('ordering_units.ordering_unit.destroy_ordering_unit'), match: :first

      expect(page).to have_text(t('ordering_units.has_doctors_or_treatments'))
    end
  end

  feature "Searching" do
    scenario "Should find proper ordering units", js: true do
      fill_in "search_form_query", with: "Test"
      expect(page).to have_text(ordering_unit2.name)
      expect(page).to_not have_text(ordering_unit.name)
    end
  end
end