require_relative '../../monster_type'
require_relative '../../monster_types/humanoid_monster'
require_relative '../../weapon'
require_relative '../../weapons/axe'
require_relative '../../weapons/knife'
require_relative '../../weapons/sword'

RSpec.describe HumanoidMonster do
  context 'PERKS' do
    it 'should have hit point +10%, attack +1 and defense +1' do
      perks = HumanoidMonster::PERKS
      expect(perks[:hit_point]).to eq 1.1
      expect(perks[:attack]).to eq 1
      expect(perks[:defense]).to eq 1
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
    let!(:original_hit_point_value) { attributes[:hit_point] }
    let!(:original_attack_value) { attributes[:attack] }
    let!(:original_defense_value) { attributes[:defense] }
    let!(:original_critical_value) { attributes[:critical] }

    context 'without weapon' do
      it 'should change attributes value based on monster perks' do
        perks_attributes = HumanoidMonster.calculate_perks(attributes)

        expect(perks_attributes[:hit_point])
          .to eq original_hit_point_value * HumanoidMonster::PERKS[:hit_point]
        expect(perks_attributes[:attack])
          .to eq original_attack_value + HumanoidMonster::PERKS[:attack]
        expect(perks_attributes[:defense])
          .to eq original_defense_value + HumanoidMonster::PERKS[:defense]
      end
    end

    context 'with weapon' do
      context 'axe' do
        it 'should change attributes value based on monster perks + Axe perks' do
          attributes[:weapon] = Axe
          perks_attributes = HumanoidMonster.calculate_perks(attributes)

          expect(perks_attributes[:hit_point])
            .to eq original_hit_point_value * HumanoidMonster::PERKS[:hit_point]
          expect(perks_attributes[:attack])
            .to eq original_attack_value + HumanoidMonster::PERKS[:attack] + Axe::PERKS[:attack]
          expect(perks_attributes[:defense])
            .to eq original_defense_value + HumanoidMonster::PERKS[:defense] + Axe::PERKS[:defense]
          expect(perks_attributes[:critical])
            .to eq original_critical_value
        end
      end

      context 'knife' do
        it 'should change attributes value based on monster perks + Knife perks' do
          attributes[:weapon] = Knife
          perks_attributes = HumanoidMonster.calculate_perks(attributes)

          expect(perks_attributes[:hit_point])
            .to eq original_hit_point_value * HumanoidMonster::PERKS[:hit_point]
          expect(perks_attributes[:attack])
            .to eq original_attack_value + HumanoidMonster::PERKS[:attack] + Knife::PERKS[:attack]
          expect(perks_attributes[:defense])
            .to eq original_defense_value + HumanoidMonster::PERKS[:defense]
          expect(perks_attributes[:critical])
            .to eq original_critical_value + Knife::PERKS[:critical]
        end
      end

      context 'sword' do
        it 'should change attributes value based on monster perks + Sword perks' do
          attributes[:weapon] = Sword
          perks_attributes = HumanoidMonster.calculate_perks(attributes)

          expect(perks_attributes[:hit_point])
            .to eq original_hit_point_value * HumanoidMonster::PERKS[:hit_point]
          expect(perks_attributes[:attack])
            .to eq original_attack_value + HumanoidMonster::PERKS[:attack] + Sword::PERKS[:attack]
          expect(perks_attributes[:defense])
            .to eq original_defense_value + HumanoidMonster::PERKS[:defense] + Sword::PERKS[:defense]
          expect(perks_attributes[:critical])
            .to eq original_critical_value
        end
      end
    end
  end
end
