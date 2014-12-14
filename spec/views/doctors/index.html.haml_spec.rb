require "rails_helper"

describe "doctors/index" do
  subject { page }
  let(:address) { build(:address, city: "Test city", street: "Test street", zip_code: "12-345") }
  let(:ordering_unit) { build(:ordering_unit, name: "Ordering unit") }
  let!(:doctor) { create(:doctor, fullname: "Fullname",specialization: "Specializtion",
    address: address, ordering_unit: ordering_unit) }
  before { visit doctors_path }

  it "proper displays all information about ordering unit" do
    expect(page).to have_content "Fullname"
    expect(page).to have_content "Specializtion"
    expect(page).to have_content "Ordering unit"
    expect(page).to have_content("Test street, 12-345 Test city")
  end
end
