require "rails_helper"

describe "ordering_units/index" do
  subject { page }
  let(:address) { build(:address, city: "Test city", street: "Test street", zip_code: "12-345") }
  let!(:ordering_unit) { create(:ordering_unit, name: "Test name", address: address) }
  let!(:doctor) { create(:doctor, ordering_unit: ordering_unit) }
  before { visit ordering_units_path }

  it "proper displays all information about ordering unit" do
    expect(page).to have_content "Test name"
    expect(page).to have_content("Test street, 12-345 Test city")
    expect(page).to have_content("1")
  end
end
