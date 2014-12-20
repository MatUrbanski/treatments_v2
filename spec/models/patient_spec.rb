require 'rails_helper'

describe Patient do
  let(:patient) { create(:patient, :male) }

  describe "#without_pesel" do
    it "should allow to save user without pesel when its true" do
      patient.update(without_pesel: true, pesel: nil)
      expect(patient.without_pesel).to eq true
    end
  end
end
