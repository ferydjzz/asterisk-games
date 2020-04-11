require_relative '../../monster_type'
require_relative '../../monster_types/humanoid_monster'
require_relative '../../weapon'
require_relative '../../weapons/axe'
require_relative '../../weapons/knife'
require_relative '../../weapons/sword'

RSpec.describe HumanoidMonster do
  context 'PERKS' do
    it 'should have hit point +10%, attack +1 and defense +1' do
      expect(HumanoidMonster::PERKS[:hit_point]).to eq 1.1
      expect(HumanoidMonster::PERKS[:attack]).to eq 1
      expect(HumanoidMonster::PERKS[:defense]).to eq 1
    end
  end

  context 'description' do
    it 'should return humanoid monster description' do
      expect(HumanoidMonster.description)
        .to eq 'Monster with high intelligence, can use weapons, stronger and more buff than humans'
    end
  end

  context 'perks_descrition' do
    it 'should return humanoid monster perks description' do
      expect(HumanoidMonster.perks_descrition)
        .to eq 'hit point +10%, attack +1, defense +1'
    end
  end

  context 'calculate_perks' do
    let(:attributes) { { hit_point: 30, attack: 3, defense: 0, critical: 0 } }

    context 'without weapon' do
      it 'should change attributes value based on monster perks' do
        perks_attributes = HumanoidMonster.calculate_perks(attributes)

        expect(perks_attributes[:hit_point]).to eq 33
        expect(perks_attributes[:attack]).to eq 4
        expect(perks_attributes[:defense]).to eq 1
      end
    end

    context 'with weapon' do
      context 'axe' do
        it 'should change attributes value based on monster perks + Axe perks' do
          attributes[:weapon] = Axe
          perks_attributes = HumanoidMonster.calculate_perks(attributes)

          expect(perks_attributes[:attack]).to eq 8
          expect(perks_attributes[:defense]).to eq 0
        end
      end

      context 'knife' do
        it 'should change attributes value based on monster perks + Knife perks' do
          attributes[:weapon] = Knife
          perks_attributes = HumanoidMonster.calculate_perks(attributes)

          expect(perks_attributes[:attack]).to eq 5
          expect(perks_attributes[:critical]).to eq 30
        end
      end

      context 'sword' do
        it 'should change attributes value based on monster perks + Sword perks' do
          attributes[:weapon] = Sword
          perks_attributes = HumanoidMonster.calculate_perks(attributes)

          expect(perks_attributes[:attack]).to eq 6
          expect(perks_attributes[:defense]).to eq 3
        end
      end
    end
  end
end
