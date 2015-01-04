require "rails_helper"

describe "treatments/index", js: true do
  subject { page }
  let!(:patient) { create(:patient) }
  let!(:patient_without_pesel) { create(:patient, without_pesel: true, pesel: nil) }
  let!(:visitation_time) { create(:visitation_time) }
  let!(:visitation_time2) { create(:visitation_time, time_of_day: "morning") }

  let!(:treatment) { create(:treatment, patient: patient) }
  let!(:treatment2) { create(:treatment, patient: patient_without_pesel) }

  before do
    treatment.visitation_times << visitation_time
    treatment.visitation_times << visitation_time2
    visit treatments_path
  end

  it "proper displays all information about treatments" do
    expect(page).to have_content patient.fullname_with_pesel
    expect(page).to have_content "#{patient_without_pesel.fullname} - #{t('patients.pesel_alert')}"
    expect(page).to have_content treatment.doctor_fullname_with_specialization
    expect(page).to have_content treatment2.doctor_fullname_with_specialization
    expect(page).to have_content treatment.medicine
    expect(page).to have_content treatment2.medicine
    find('.days', match: :first).click
    expect(page).to have_content visitation_time.day_with_time_of_day
    expect(page).to have_content visitation_time2.day_with_time_of_day
    expect(page).to have_content "#{t('treatments.treatment.sum')} #{treatment.visitation_times.count}"
  end
end
