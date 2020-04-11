require_relative '../monster_type'
require_relative '../monster_types/golem'
require_relative '../monster_types/animal_monster'
require_relative '../monster_types/humanoid_monster'

RSpec.describe MonsterType do
  context 'descendants' do
    it 'should return [Golem, AnimalMonster, HumanoidMonster]' do
      descendants = MonsterType.descendants
      expect([Golem, AnimalMonster, HumanoidMonster] - descendants).to be_empty
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { hit_point: 30, attack: 3, defense: 0 } }

    it 'should raise error if called from parent class' do
      expect { MonsterType.calculate_perks(attributes) }
        .to raise_error('calculate_perks can only be called by child class')
    end
  end
end
