require_relative '../monster_type'

RSpec.describe MonsterType do
  context 'calculate_perks' do
    let(:attributes) { { hit_point: 30, attack: 3, defense: 0 } }

    it 'should raise error if called from parent class' do
      expect { MonsterType.calculate_perks(attributes) }
        .to raise_error('calculate_perks can only be called by child class')
    end
  end
end
