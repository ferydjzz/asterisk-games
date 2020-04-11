require_relative '../weapon'
require_relative '../weapons/sword'
require_relative '../weapons/knife'
require_relative '../weapons/axe'

RSpec.describe Weapon do
  context 'descendants' do
    it 'should return [Axe, Knife, Sword]' do
      descendants = Weapon.descendants
      expect([Axe, Knife, Sword] - descendants).to be_empty
    end
  end

  context 'name' do
    it 'should raise error if called from parent class' do
      expect { Weapon.name }.to raise_error('name can only be called by child class')
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { attack: 10, defense: 10, critical: 0 } }

    it 'should raise error if called from parent class' do
      expect { Weapon.calculate_perks(attributes) }
        .to raise_error('calculate_perks can only be called by child class')
    end
  end
end
