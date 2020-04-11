require_relative '../../weapon'
require_relative '../../weapons/sword'

RSpec.describe Sword do
  context 'PERKS' do
    it 'should have attack +2 and defense +2' do
      perks = Sword::PERKS
      expect(perks[:attack]).to eq 2
      expect(perks[:defense]).to eq 2
    end
  end

  context 'name' do
    it 'should return Sword' do
      expect(Sword.name).to eq 'Sword'
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { attack: 10, defense: 10, critical: 0 } }

    it 'should change attributes value based on perks' do
      original_attack_value = attributes[:attack]
      original_defense_value = attributes[:defense]

      perks_attributes = Sword.calculate_perks(attributes)

      expect(perks_attributes[:attack]).to eq original_attack_value + Sword::PERKS[:attack]
      expect(perks_attributes[:defense]).to eq original_defense_value + Sword::PERKS[:defense]
    end
  end
end
