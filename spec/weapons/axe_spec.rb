require_relative '../../weapon'
require_relative '../../weapons/axe'

RSpec.describe Axe do
  context 'PERKS' do
    it 'should have attack +4 and defense -1' do
      perks = Axe::PERKS
      expect(perks[:attack]).to eq 4
      expect(perks[:defense]).to eq -1
    end
  end

  context 'name' do
    it 'should return Axe' do
      expect(Axe.name).to eq 'Axe'
    end
  end

  context 'calculate_perks' do
    let(:attributes) { {attack: 10, defense: 10, critical: 0} }

    it 'should change attributes value based on perks' do
      original_attack_value = attributes[:attack]
      original_defense_value = attributes[:defense]

      perks_attributes = Axe.calculate_perks(attributes)

      expect(perks_attributes[:attack]).to eq original_attack_value + Axe::PERKS[:attack]
      expect(perks_attributes[:defense]).to eq original_defense_value + Axe::PERKS[:defense]
    end
  end
end