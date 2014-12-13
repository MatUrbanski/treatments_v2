require "rails_helper"

describe "ordering_units/index" do
  subject { page }
  let!(:ordering_unit) { create(:ordering_unit, name: "Test name") }
  before { visit ordering_units_path }

  it "proper displays all information about ordering unit" do
    expect(page).to have_content "Test name"
  end
end
