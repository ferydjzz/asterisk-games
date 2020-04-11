require_relative '../../monster_type'
require_relative '../../monster_types/animal_monster'

RSpec.describe AnimalMonster do
  context 'PERKS' do
    it 'should have hit point +10% and attack +1' do
      perks = AnimalMonster::PERKS
      expect(perks[:hit_point]).to eq 1.1
      expect(perks[:attack]).to eq 1
    end
  end

  context 'description' do
    it 'should return animal monster description' do
      expect(AnimalMonster.description)
        .to eq 'Corrupted animals turned into monster,
      retaining their body but also has more dangerous claws and fangs'
    end
  end

  context 'perks_descrition' do
    it 'should return animal monster perks description' do
      expect(AnimalMonster.perks_descrition)
        .to eq 'hit point +10%, attack +1'
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { hit_point: 30, attack: 3, defense: 0 } }

    it 'should change attributes value based on perks' do
      original_hit_point_value = attributes[:hit_point]
      original_attack_value = attributes[:attack]

      perks_attributes = AnimalMonster.calculate_perks(attributes)

      expect(perks_attributes[:hit_point])
        .to eq original_hit_point_value * AnimalMonster::PERKS[:hit_point]
      expect(perks_attributes[:attack])
        .to eq original_attack_value + AnimalMonster::PERKS[:attack]
    end
  end
end
