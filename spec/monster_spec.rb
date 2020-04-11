require_relative '../character'
require_relative '../monster'
require_relative '../monster_type'
require_relative '../monster_types/golem'
require_relative '../monster_types/animal_monster'
require_relative '../monster_types/humanoid_monster'
require_relative '../weapon'
require_relative '../weapons/axe'
require_relative '../weapons/knife'
require_relative '../weapons/sword'

RSpec.describe Monster do
  context 'ORIGINAL_ATTRIBUTES' do
    it 'should have original attributes hit_point: 20, attack: 5, defense: 1, critical: 0' do
      expect(Monster::ORIGINAL_ATTRIBUTES)
        .to eq ( { hit_point: 30, attack: 3, defense: 0, critical: 0 } )
    end
  end

  context 'initialize' do
    let(:original_hit_point_value) { Monster::ORIGINAL_ATTRIBUTES[:hit_point] }
    let(:original_attack_value) { Monster::ORIGINAL_ATTRIBUTES[:attack] }
    let(:original_defense_value) { Monster::ORIGINAL_ATTRIBUTES[:defense] }
    let(:original_critical_value) { Monster::ORIGINAL_ATTRIBUTES[:critical] }

    context 'Golem' do
      it 'should add golem perks to original monster attributes' do
        golem = Monster.new('Melog', Golem)
        monster_attributes = golem.informations

        expect(monster_attributes[:hit_point])
          .to eq original_hit_point_value * Golem::PERKS[:hit_point]
        expect(monster_attributes[:attack])
          .to eq original_attack_value
        expect(monster_attributes[:defense])
          .to eq original_defense_value + Golem::PERKS[:defense]
        expect(monster_attributes[:critical])
          .to eq original_critical_value
      end
    end

    context 'AnimalMonster' do
      it 'should add animal monster perks to original monster attributes' do
        animal_monster = Monster.new('Retsnom Lamina', AnimalMonster)
        monster_attributes = animal_monster.informations

        expect(monster_attributes[:hit_point])
          .to eq original_hit_point_value * AnimalMonster::PERKS[:hit_point]
        expect(monster_attributes[:attack])
          .to eq original_attack_value + AnimalMonster::PERKS[:attack]
        expect(monster_attributes[:defense])
          .to eq original_defense_value
        expect(monster_attributes[:critical])
          .to eq original_critical_value
      end
    end

    context 'HumanoidMonster' do
      context 'without weapon' do
        it 'should add humanoid monster perks to original monster attributes' do
          allow_any_instance_of(Monster).to receive(:randomize_weapon) { nil }
          humanoid_monster = Monster.new('Retsnom Lamina', HumanoidMonster)
          monster_attributes = humanoid_monster.informations

          expect(monster_attributes[:hit_point])
            .to eq original_hit_point_value * HumanoidMonster::PERKS[:hit_point]
          expect(monster_attributes[:attack])
            .to eq original_attack_value + HumanoidMonster::PERKS[:attack]
          expect(monster_attributes[:defense])
            .to eq original_defense_value + HumanoidMonster::PERKS[:defense]
          expect(monster_attributes[:critical])
            .to eq original_critical_value
        end
      end

      context 'with weapon' do
        context 'axe' do
          it 'should add humanoid monster perks to original monster attributes + Axe perks' do
            allow_any_instance_of(Monster).to receive(:randomize_weapon) { |monster| monster.weapon = Axe }
            humanoid_monster = Monster.new('Retsnom Lamina', HumanoidMonster)
            monster_attributes = humanoid_monster.informations

            expect(monster_attributes[:hit_point])
            .to eq original_hit_point_value * HumanoidMonster::PERKS[:hit_point]
            expect(monster_attributes[:attack])
              .to eq original_attack_value + HumanoidMonster::PERKS[:attack] + Axe::PERKS[:attack]
            expect(monster_attributes[:defense])
              .to eq original_defense_value + HumanoidMonster::PERKS[:defense] + Axe::PERKS[:defense]
            expect(monster_attributes[:critical])
              .to eq original_critical_value
          end
        end

        context 'knife' do
          it 'should add humanoid monster perks to original monster attributes + Knife perks' do
            allow_any_instance_of(Monster).to receive(:randomize_weapon) { |monster| monster.weapon = Knife }
            humanoid_monster = Monster.new('Retsnom Lamina', HumanoidMonster)
            monster_attributes = humanoid_monster.informations

            expect(monster_attributes[:hit_point])
            .to eq original_hit_point_value * HumanoidMonster::PERKS[:hit_point]
            expect(monster_attributes[:attack])
              .to eq original_attack_value + HumanoidMonster::PERKS[:attack] + Knife::PERKS[:attack]
            expect(monster_attributes[:defense])
              .to eq original_defense_value + HumanoidMonster::PERKS[:defense]
            expect(monster_attributes[:critical])
              .to eq original_critical_value + Knife::PERKS[:critical]
          end
        end

        context 'sword' do
          it 'should add humanoid monster perks to original monster attributes + Sword perks' do
            allow_any_instance_of(Monster).to receive(:randomize_weapon) { |monster| monster.weapon = Sword }
            humanoid_monster = Monster.new('Retsnom Lamina', HumanoidMonster)
            monster_attributes = humanoid_monster.informations

            expect(monster_attributes[:hit_point])
            .to eq original_hit_point_value * HumanoidMonster::PERKS[:hit_point]
            expect(monster_attributes[:attack])
              .to eq original_attack_value + HumanoidMonster::PERKS[:attack] + Sword::PERKS[:attack]
            expect(monster_attributes[:defense])
              .to eq original_defense_value + HumanoidMonster::PERKS[:defense] + Sword::PERKS[:defense]
            expect(monster_attributes[:critical])
              .to eq original_critical_value
          end
        end
      end
    end
  end
end
