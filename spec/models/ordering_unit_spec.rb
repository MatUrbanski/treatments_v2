require 'rails_helper'

describe OrderingUnit do
  let!(:ordering_unit) { create(:ordering_unit, name: "Ordering unit") }
  let!(:ordering_unit2) { create(:ordering_unit, name: "Test ordering unit") }

  describe ".search" do
    context "by name" do
      it "should find proper ordering units" do
        expect(OrderingUnit.search(ordering_unit.name)).to match_array ordering_unit
        expect(OrderingUnit.search(ordering_unit2.name)).to match_array ordering_unit2
      end
    end

    context "address street" do
      it "should find proper doctors" do
        expect(OrderingUnit.search(ordering_unit.address_street)).to match_array ordering_unit
        expect(OrderingUnit.search(ordering_unit2.address_street)).to match_array ordering_unit2
      end
    end

    context "address city" do
      it "should find proper doctors" do
        expect(OrderingUnit.search(ordering_unit.address_city)).to match_array ordering_unit
        expect(OrderingUnit.search(ordering_unit2.address_city)).to match_array ordering_unit2
      end
    end

    context "address zip_code" do
      it "should find proper doctors" do
        expect(OrderingUnit.search(ordering_unit.address_zip_code)).to match_array ordering_unit
        expect(OrderingUnit.search(ordering_unit2.address_zip_code)).to match_array ordering_unit2
      end
    end
  end
end
