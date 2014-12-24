require 'rails_helper'

describe Patient do
  let(:patient) { create(:patient, :male, fullname: "Patient", pesel: "12345678901") }
  let(:patient2) { create(:patient, :male, fullname: "Test patient", pesel: "09876543210") }

  describe "#without_pesel" do
    it "should allow to save user without pesel when its true" do
      patient.update(without_pesel: true, pesel: nil)
      expect(patient.without_pesel).to eq true
    end
  end

  describe ".search" do
    it "should find proper TreatmentType" do
      expect(Patient.search("1234")).to match_array patient
      expect(Patient.search("098")).to match_array patient2
      expect(Patient.search("Patient")).to match_array patient
      expect(Patient.search("Test")).to match_array patient2
    end
  end
end
