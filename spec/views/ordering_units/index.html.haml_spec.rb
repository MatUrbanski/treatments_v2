require "rails_helper"

describe "ordering_units/index" do
  subject { page }
  let!(:ordering_unit) { create(:ordering_unit) }
  let!(:doctor) { create(:doctor, ordering_unit: ordering_unit) }
  before { visit ordering_units_path }

  it "proper displays all information about ordering unit" do
    expect(page).to have_content ordering_unit.name
    expect(page).to have_content ordering_unit.address.to_formatted_s
    expect(page).to have_content ordering_unit.doctors.count
  end
end
