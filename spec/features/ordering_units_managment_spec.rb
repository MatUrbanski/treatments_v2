require "rails_helper"

feature "Ordering units management" do

  scenario "Creating new ordering unit" do
    visit 'ordering_units/new'

    fill_in I18n.t('activerecord.attributes.ordering_unit.name'), with: "Ordering unit name"
    click_button I18n.t('submit')

    expect(page).to have_text(I18n.t('ordering_units.created'))
    expect(page).to have_content("Ordering unit name")
  end
end