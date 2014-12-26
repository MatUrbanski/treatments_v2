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
    context "using fullname" do
      it "should find proper Patient" do
        expect(Patient.search(patient.fullname)).to match_array patient
        expect(Patient.search(patient2.fullname)).to match_array patient2
      end
    end

    context "using pesel" do
      it "should find proper patients" do
        expect(Patient.search(patient.pesel)).to match_array patient
        expect(Patient.search(patient2.pesel)).to match_array patient2
      end
    end

    context "address street" do
      it "should find proper patients" do
        expect(Patient.search(patient.address_street)).to match_array patient
        expect(Patient.search(patient2.address.street)).to match_array patient2
      end
    end

    context "address city" do
      it "should find proper patients" do
        expect(Patient.search(patient.address_city)).to match_array patient
        expect(Patient.search(patient2.address_city)).to match_array patient2
      end
    end

    context "address zip_code" do
      it "should find proper patients" do
        expect(Patient.search(patient.address_zip_code)).to match_array patient
        expect(Patient.search(patient2.address_zip_code)).to match_array patient2
      end
    end
  end
end
