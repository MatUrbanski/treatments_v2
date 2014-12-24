require 'rails_helper'

describe TreatmentType do
  let(:treatment_type) { create(:treatment_type, name: "Treatment type") }
  let(:treatment_type2) { create(:treatment_type, name: "Test treatment type") }

  describe ".search" do
    it "should find proper treatment types" do
      expect(TreatmentType.search("Treatment")).to match_array treatment_type
      expect(TreatmentType.search("Test")).to match_array treatment_type2
    end
  end
end
