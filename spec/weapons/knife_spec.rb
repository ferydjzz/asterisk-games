require_relative '../../weapon'
require_relative '../../weapons/knife'

RSpec.describe Knife do
  context 'PERKS' do
    it 'should have attack +1 and critical 30%' do
      perks = Knife::PERKS
      expect(perks[:attack]).to eq 1
      expect(perks[:critical]).to eq 30
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
      original_attack_value = attributes[:attack]
      original_critical_value = attributes[:critical]

      perks_attributes = Knife.calculate_perks(attributes)

      expect(perks_attributes[:attack]).to eq original_attack_value + Knife::PERKS[:attack]
      expect(perks_attributes[:critical]).to eq original_critical_value + Knife::PERKS[:critical]
    end
  end
end
