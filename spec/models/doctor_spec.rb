require 'rails_helper'

describe Doctor do
  let!(:doctor) { create(:doctor, fullname: "Doctor", specialization: "Specialization") }
  let!(:doctor2) { create(:doctor, fullname: "Test doctor", specialization: "Test specialization") }

  describe ".search" do
    context "using fullname" do
      it "should find proper doctors" do
        expect(Doctor.search(doctor.fullname)).to match_array doctor
        expect(Doctor.search(doctor2.fullname)).to match_array doctor2
      end
    end

    context "using specialization" do
      it "should find proper doctors" do
        expect(Doctor.search(doctor.specialization)).to match_array doctor
        expect(Doctor.search(doctor2.specialization)).to match_array doctor2
      end
    end

    context "address street" do
      it "should find proper doctors" do
        expect(Doctor.search(doctor.address_street)).to match_array doctor
        expect(Doctor.search(doctor2.address_street)).to match_array doctor2
      end
    end

    context "address city" do
      it "should find proper doctors" do
        expect(Doctor.search(doctor.address_city)).to match_array doctor
        expect(Doctor.search(doctor2.address_city)).to match_array doctor2
      end
    end

    context "address zip_code" do
      it "should find proper doctors" do
        expect(Doctor.search(doctor.address_zip_code)).to match_array doctor
        expect(Doctor.search(doctor2.address_zip_code)).to match_array doctor2
      end
    end
  end

  describe "#fullname_with_specialization" do
    it "should return doctor fullname with specialization" do
      expect(doctor.fullname_with_specialization).to eq "#{doctor.fullname} - #{doctor.specialization}"
    end
  end
end
