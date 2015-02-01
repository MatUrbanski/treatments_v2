require "rails_helper"

feature 'Monthly report' do
  subject { page }
  let!(:patient) { create(:patient) }
  let!(:visitation_time) { create(:visitation_time, day: Date.today) }
  let!(:treatment) { create(:treatment, patient: patient) }

  before do
    treatment.visitation_times << visitation_time
    visit monthly_report_path
  end

  feature 'display data for current month' do
    it 'return monthly report for current month' do
      expect(page).to have_content "#{treatment.treatment_type.treatment_types_group_name}: 0"
      expect(page).to have_content "#{treatment.treatment_type_name}: 0"
      expect(page).to have_content "#{treatment.treatment_type.treatment_types_group_name}: 1"
      expect(page).to have_content "#{treatment.treatment_type_name}: 1"
    end
  end
end
