require 'rails_helper'

describe Doctor do
  let!(:doctor) { create(:doctor, fullname: "Doctor", specialization: "Specialization") }
  let!(:doctor2) { create(:doctor, fullname: "Test doctor", specialization: "Test specialization") }

  describe ".search" do
    context "using fullname" do
      it "should find proper doctors" do
        expect(Doctor.search("Doctor")).to match_array doctor
        expect(Doctor.search("Test")).to match_array doctor2
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
        expect(Doctor.search(doctor.address.street)).to match_array doctor
        expect(Doctor.search(doctor2.address.street)).to match_array doctor2
      end
    end

    context "address city" do
      it "should find proper doctors" do
        expect(Doctor.search(doctor.address.city)).to match_array doctor
        expect(Doctor.search(doctor2.address.city)).to match_array doctor2
      end
    end

    context "address zip_code" do
      it "should find proper doctors" do
        expect(Doctor.search(doctor.address.zip_code)).to match_array doctor
        expect(Doctor.search(doctor2.address.zip_code)).to match_array doctor2
      end
    end
  end
end
