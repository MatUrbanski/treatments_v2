require "rails_helper"

describe "treatment_types/index" do
  subject { page }
  let!(:group) { create(:treatment_types_group, name: "Test group") }
  let!(:treatment_type) { create(:treatment_type,
    treatment_types_group: group, name: "Test treatment type") }
  before { visit treatment_types_path }

  it "proper displays all information about doctor" do
    expect(page).to have_content "Test group"
    expect(page).to have_content "Test treatment type"
  end
end
