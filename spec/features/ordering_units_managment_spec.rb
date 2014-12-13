require "rails_helper"

feature "Ordering units management" do
  let!(:ordering_unit)  {create(:ordering_unit)}

  scenario "Creating new Ordering Unit" do
    visit ordering_units_path
    click_link t('ordering_units.index.new_ordering_unit')
    fill_in t('activerecord.attributes.ordering_unit.name'), with: "Ordering unit name"
    click_button t('submit')

    expect(page).to have_text(t('ordering_units.created'))
    expect(page).to have_content("Ordering unit name")
  end

  scenario "Updating existing Ordering Unit" do
    visit ordering_units_path
    click_link t('ordering_units.ordering_unit.edit_ordering_unit')
    fill_in t('activerecord.attributes.ordering_unit.name'), with: "Updated Ordering unit name"
    click_button t('submit')

    expect(page).to have_text(t('ordering_units.updated'))
    expect(page).to have_content("Updated Ordering unit name")
  end

  scenario "Deleting existing Ordering Unit" do
    visit ordering_units_path
    click_link t('ordering_units.ordering_unit.destroy_ordering_unit')

    expect(page).to have_text(t('ordering_units.destroyed'))
  end
end