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
    context 'Golem' do
      it 'should add golem perks to original monster attributes' do
        golem = Monster.new('Melog', Golem)
        monster_attributes = golem.informations

        expect(monster_attributes[:hit_point]).to eq 36
        expect(monster_attributes[:attack]).to eq 3
        expect(monster_attributes[:defense]).to eq 2
        expect(monster_attributes[:critical]).to eq 0
      end
    end

    context 'AnimalMonster' do
      it 'should add animal monster perks to original monster attributes' do
        animal_monster = Monster.new('Retsnom Lamina', AnimalMonster)
        monster_attributes = animal_monster.informations

        expect(monster_attributes[:hit_point]).to eq 33
        expect(monster_attributes[:attack]).to eq 4
        expect(monster_attributes[:defense]).to eq 0
        expect(monster_attributes[:critical]).to eq 0
      end
    end

    context 'HumanoidMonster' do
      context 'without weapon' do
        it 'should add humanoid monster perks to original monster attributes' do
          allow_any_instance_of(Monster).to receive(:randomize_weapon) { nil }
          humanoid_monster = Monster.new('Retsnom Lamina', HumanoidMonster)
          monster_attributes = humanoid_monster.informations

          expect(monster_attributes[:hit_point]).to eq 33
          expect(monster_attributes[:attack]).to eq 4
          expect(monster_attributes[:defense]).to eq 1
          expect(monster_attributes[:critical]).to eq 0
        end
      end

      context 'with weapon' do
        context 'axe' do
          it 'should add humanoid monster perks to original monster attributes + Axe perks' do
            allow_any_instance_of(Monster).to receive(:randomize_weapon) { |monster| monster.weapon = Axe }
            humanoid_monster = Monster.new('Retsnom Lamina', HumanoidMonster)
            monster_attributes = humanoid_monster.informations

            expect(monster_attributes[:hit_point]).to eq 33
            expect(monster_attributes[:attack]).to eq 8
            expect(monster_attributes[:defense]).to eq 0
            expect(monster_attributes[:critical]).to eq 0
          end
        end

        context 'knife' do
          it 'should add humanoid monster perks to original monster attributes + Knife perks' do
            allow_any_instance_of(Monster).to receive(:randomize_weapon) { |monster| monster.weapon = Knife }
            humanoid_monster = Monster.new('Retsnom Lamina', HumanoidMonster)
            monster_attributes = humanoid_monster.informations

            expect(monster_attributes[:hit_point]).to eq 33
            expect(monster_attributes[:attack]).to eq 5
            expect(monster_attributes[:defense]).to eq 1
            expect(monster_attributes[:critical]).to eq 30
          end
        end

        context 'sword' do
          it 'should add humanoid monster perks to original monster attributes + Sword perks' do
            allow_any_instance_of(Monster).to receive(:randomize_weapon) { |monster| monster.weapon = Sword }
            humanoid_monster = Monster.new('Retsnom Lamina', HumanoidMonster)
            monster_attributes = humanoid_monster.informations

            expect(monster_attributes[:hit_point]).to eq 33
            expect(monster_attributes[:attack]).to eq 6
            expect(monster_attributes[:defense]).to eq 3
            expect(monster_attributes[:critical]).to eq 0
          end
        end
      end
    end
  end
end
