require 'rails_helper'

describe Doctor do
  let!(:doctor) { create(:doctor, fullname: "Doctor", specialization: "Specialization") }
  let!(:doctor2) { create(:doctor, fullname: "Test doctor", specialization: "Test specialization") }

  describe ".search" do
    it "should find proper doctors" do
      expect(Doctor.search("Doctor")).to match_array doctor
      expect(Doctor.search("Specialization")).to match_array doctor
      expect(Doctor.search("Test")).to match_array doctor2
    end
  end
end
