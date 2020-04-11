require_relative '../../monster_type'
require_relative '../../monster_types/golem'

RSpec.describe Golem do
  context 'PERKS' do
    it 'should have hit point +20% and defense +2' do
      perks = Golem::PERKS
      expect(perks[:hit_point]).to eq 1.2
      expect(perks[:defense]).to eq 2
    end
  end

  context 'description' do
    it 'should return golem description' do
      expect(Golem.description)
        .to eq 'Ancient constructs very durable'
    end
  end

  context 'perks_descrition' do
    it 'should return golem perks description' do
      expect(Golem.perks_descrition)
        .to eq 'hit point +20%, defense +2'
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { hit_point: 30, attack: 3, defense: 0 } }

    it 'should change attributes value based on perks' do
      original_hit_point_value = attributes[:hit_point]
      original_defense_value = attributes[:defense]

      perks_attributes = Golem.calculate_perks(attributes)

      expect(perks_attributes[:hit_point]).to eq original_hit_point_value * Golem::PERKS[:hit_point]
      expect(perks_attributes[:defense]).to eq original_defense_value + Golem::PERKS[:defense]
    end
  end
end
