require "rails_helper"

describe "patients/index" do
  subject { page }
  let!(:patient) { create(:patient, :male) }
  let!(:patient_without_pesel) { create(:patient, :female, without_pesel: true, pesel: nil) }
  before { visit patients_path }

  it "proper displays all information about patients" do
    expect(page).to have_content patient.fullname
    expect(page).to have_content patient_without_pesel.fullname
    expect(page).to have_content patient.pesel
    expect(page).to have_content(t('patients.pesel_alert'))
    expect(page).to have_content patient.address.to_formatted_s
    expect(page).to have_content patient_without_pesel.address.to_formatted_s
    expect(page).to have_content(t('sex.male'))
    expect(page).to have_content(t('sex.female'))
    expect(page).to have_content patient.birth_date
    expect(page).to have_content patient_without_pesel.birth_date
  end
end
