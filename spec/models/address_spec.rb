require 'rails_helper'

describe Address do
  let(:address) {build(:address, city: "City",
    street: "Street", zip_code: "12-345")}

  describe "#to_formatted_s" do
    it "should return formatted address" do
      expect(address.to_formatted_s).to eq "Street, 12-345 City"
    end
  end

  describe "zip_code" do
    context "match /[0-9]{2}-[0-9]{3}/ regex" do
      it "should be valid" do
        zip_codes = %w[12-345 34-576 03-234 23-495]
        zip_codes.each do |valid_zip_code|
          address.zip_code = valid_zip_code
          expect(address).to be_valid
        end
      end
    end

    context "match /[0-9]{2}-[0-9]{3}/ regex" do
      it "should not be valid" do
        zip_codes = %w[122-12 342576 0123234 2133-4]
        zip_codes.each do |invalid_zip_code|
          address.zip_code = invalid_zip_code
          expect(address).to_not be_valid
        end
      end
    end
  end
end
