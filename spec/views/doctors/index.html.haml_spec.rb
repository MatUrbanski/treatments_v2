require "rails_helper"

describe "doctors/index" do
  subject { page }
  let!(:doctor) { create(:doctor) }
  before { visit doctors_path }

  it "proper displays all information about doctor" do
    expect(page).to have_content doctor.fullname
    expect(page).to have_content doctor.specialization
    expect(page).to have_content doctor.ordering_unit.name
    expect(page).to have_content doctor.address.to_formatted_s
  end
end
