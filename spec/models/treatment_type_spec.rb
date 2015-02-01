require 'rails_helper'

describe TreatmentType do
  let(:treatment_type) { create(:treatment_type, name: 'Treatment type') }
  let(:treatment_type2) { create(:treatment_type, name: 'Test treatment type') }

  describe '.search' do
    context 'using name' do
      it 'should find proper treatment types' do
        expect(TreatmentType.search(treatment_type.name)).to match_array treatment_type
        expect(TreatmentType.search(treatment_type2.name)).to match_array treatment_type2
      end
    end

    context 'using associated treatment_types_group name' do
      it 'should find proper treatment types' do
        expect(TreatmentType.search(treatment_type.treatment_types_group.name)).to match_array treatment_type
        expect(TreatmentType.search(treatment_type2.treatment_types_group.name)).to match_array treatment_type2
      end
    end
  end

  describe '#name_with_group_name' do
    it 'should return treatment type with treatment type group name' do
      expect(treatment_type.name_with_group_name).to eq "#{treatment_type.name} - #{treatment_type.treatment_types_group.name}"
    end
  end
end
