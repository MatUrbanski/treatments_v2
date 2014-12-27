require "rails_helper"

describe "doctors/index" do
  subject { page }
  let!(:doctor) { create(:doctor) }

  before do
    doctor.reload
    visit doctors_path
  end

  it "proper displays all information about doctor" do
    expect(page).to have_content doctor.fullname
    expect(page).to have_content doctor.specialization
    expect(page).to have_content doctor.ordering_unit_name
    expect(page).to have_content doctor.address_to_formatted_s
    expect(page).to have_content doctor.treatments_count
  end
end
