require 'rails_helper'

describe Address do
  let(:address) {build(:address, city: "City",
    street: "Street", zip_code: "12-345")}

  describe "#to_formatted_s" do
    it "should return formatted address" do
      expect(address.to_formatted_s).to eq "Street, 12-345 City"
    end
  end
end
