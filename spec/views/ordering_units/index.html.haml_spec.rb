require "rails_helper"

describe "ordering_units/index" do
  subject { page }
  let!(:ordering_unit) { create(:ordering_unit) }
  let!(:doctor) { create(:doctor, ordering_unit: ordering_unit) }

  before do
    ordering_unit.reload
    doctor.reload
    visit ordering_units_path
  end

  it "proper displays all information about ordering unit" do
    expect(page).to have_content ordering_unit.name
    expect(page).to have_content ordering_unit.address_to_formatted_s
    expect(page).to have_content ordering_unit.doctors_count
    expect(page).to have_content ordering_unit.treatments_count
  end
end
