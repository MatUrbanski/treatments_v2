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
    context "by name" do
      it "should find proper ordering units" do
        expect(OrderingUnit.search(ordering_unit.name)).to match_array ordering_unit
        expect(OrderingUnit.search(ordering_unit2.name)).to match_array ordering_unit2
      end
    end

    context "address street" do
      it "should find proper doctors" do
        expect(OrderingUnit.search(ordering_unit.address.street)).to match_array ordering_unit
        expect(OrderingUnit.search(ordering_unit2.address.street)).to match_array ordering_unit2
      end
    end

    context "address city" do
      it "should find proper doctors" do
        expect(OrderingUnit.search(ordering_unit.address.city)).to match_array ordering_unit
        expect(OrderingUnit.search(ordering_unit2.address.city)).to match_array ordering_unit2
      end
    end

    context "address zip_code" do
      it "should find proper doctors" do
        expect(OrderingUnit.search(ordering_unit.address.zip_code)).to match_array ordering_unit
        expect(OrderingUnit.search(ordering_unit2.address.zip_code)).to match_array ordering_unit2
      end
    end
  end
end
