require "rails_helper"

feature "Monthly report" do
  subject { page }
  let!(:patient) { create(:patient) }
  let!(:visitation_time) { create(:visitation_time, day: "17-01-2015") }
  let!(:visitation_time2) { create(:visitation_time, day: "15-02-2015") }
  let!(:visitation_time3) { create(:visitation_time, day: "18-02-2015") }
  let!(:treatment) { create(:treatment, patient: patient) }

  before do
    treatment.visitation_times << visitation_time
    treatment.visitation_times << visitation_time2
    treatment.visitation_times << visitation_time3
    visit monthly_report_path
  end

  feature "display data for current month" do
    it "return monthly report for current month" do
      expect(page).to have_content "#{treatment.treatment_type.treatment_types_group_name}: 0"
      expect(page).to have_content "#{treatment.treatment_type_name}: 0"
      expect(page).to have_content "#{treatment.treatment_type.treatment_types_group_name}: 1"
      expect(page).to have_content "#{treatment.treatment_type_name}: 1"
    end
  end
end
