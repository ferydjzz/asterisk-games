require_relative '../../weapon'
require_relative '../../weapons/knife'

RSpec.describe Knife do
  context 'PERKS' do
    it 'should have attack +1 and critical 30%' do
      expect(Knife::PERKS[:attack]).to eq 1
      expect(Knife::PERKS[:critical]).to eq 30
    end
  end

  context 'name' do
    it 'should return Knife' do
      expect(Knife.name).to eq 'Knife'
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { attack: 10, defense: 10, critical: 0 } }

    it 'should change attributes value based on perks' do
      perks_attributes = Knife.calculate_perks(attributes)

      expect(perks_attributes[:attack]).to eq 11
      expect(perks_attributes[:critical]).to eq 30
    end
  end
end
