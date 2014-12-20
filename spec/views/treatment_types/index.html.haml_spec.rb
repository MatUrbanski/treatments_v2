require "rails_helper"

describe "treatment_types/index" do
  subject { page }
  let!(:treatment_type) { create(:treatment_type) }
  before { visit treatment_types_path }

  it "proper displays all information about doctor" do
    expect(page).to have_content treatment_type.name
    expect(page).to have_content treatment_type.treatment_types_group.name
  end
end
