require 'rails_helper'

describe OrderingUnit do
  let!(:ordering_unit) { create(:ordering_unit, name: "Ordering unit") }
  let!(:ordering_unit2) { create(:ordering_unit, name: "Test ordering unit") }

  describe "#doctors_count" do
    context "when don't have associated doctors" do
      it "should return 0" do
        expect(ordering_unit.doctors_count).to eq 0
      end
    end

    context "when have associated doctors" do
      let!(:doctor) { create(:doctor, ordering_unit: ordering_unit) }
      it "should return doctors count" do
        expect(ordering_unit.doctors_count).to eq 1
      end
    end
  end

  describe ".search" do
    it "should find proper ordering units" do
      expect(OrderingUnit.search("Test")).to match_array ordering_unit2
      expect(OrderingUnit.search("Ordering")).to match_array ordering_unit
    end
  end
end
