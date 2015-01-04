require 'rails_helper'

describe Treatment do
  let(:treatment) { create(:treatment) }
  let(:treatment2) { create(:treatment) }

  describe ".search" do
    context "using patient fullname" do
      it "should find proper treatments" do
        expect(Treatment.search(treatment.patient.fullname)).to match_array treatment
        expect(Treatment.search(treatment2.patient.fullname)).to match_array treatment2
      end
    end

    context "using patient pesel" do
      it "should find proper treatments" do
        expect(Treatment.search(treatment.patient.pesel)).to match_array treatment
        expect(Treatment.search(treatment2.patient.pesel)).to match_array treatment2
      end
    end

    context "using doctor fullname" do
      it "should find proper treatments" do
        expect(Treatment.search(treatment.doctor.fullname)).to match_array treatment
        expect(Treatment.search(treatment2.doctor.fullname)).to match_array treatment2
      end
    end

    context "using doctor specialization" do
      it "should find proper treatments" do
        expect(Treatment.search(treatment.doctor.specialization)).to match_array treatment
        expect(Treatment.search(treatment2.doctor.specialization)).to match_array treatment2
      end
    end

    context "using treatment_type name" do
      it "should find proper treatments" do
        expect(Treatment.search(treatment.treatment_type.name)).to match_array treatment
        expect(Treatment.search(treatment2.treatment_type.name)).to match_array treatment2
      end
    end

    context "using medicine" do
      it "should find proper treatments" do
        expect(Treatment.search(treatment.medicine)).to match_array treatment
        expect(Treatment.search(treatment2.medicine)).to match_array treatment2
      end
    end
  end

  describe "#visitation_times_count" do
    it "should return visitation_times count" do
      expect(treatment.visitation_times_count).to eq treatment.visitation_times.count
    end
  end
end
