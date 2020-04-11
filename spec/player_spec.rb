require_relative '../character'
require_relative '../player'
require_relative '../weapon'
require_relative '../weapons/axe'
require_relative '../weapons/knife'
require_relative '../weapons/sword'

RSpec.describe Player do
  context 'ORIGINAL_ATTRIBUTES' do
    it 'should have original attributes hit_point: 20, attack: 5, defense: 1, critical: 0' do
      expect(Player::ORIGINAL_ATTRIBUTES)
        .to eq ( { hit_point: 20, attack: 5, defense: 1, critical: 0 } )
    end
  end

  context 'initialize' do
    context 'without weapon' do
      it 'should not get additional perks from weapon' do
        player_number_1 = Player.new('Number 1', nil)
        expect(player_number_1.informations)
          .to eq ( { name: "Number 1", hit_point: 20, attack: 5, defense: 1, weapon: nil, critical: 0 } )
      end
    end

    context 'with weapon' do
      let(:original_hit_point_value) { Player::ORIGINAL_ATTRIBUTES[:hit_point] }
      let(:original_attack_value) { Player::ORIGINAL_ATTRIBUTES[:attack] }
      let(:original_defense_value) { Player::ORIGINAL_ATTRIBUTES[:defense] }
      let(:original_critical_value) { Player::ORIGINAL_ATTRIBUTES[:critical] }

      context 'axe' do
        it 'should change attributes value based Axe perks' do
          player_number_2 = Player.new('Number 2', Axe)
          player_attributes = player_number_2.informations

          expect(player_attributes[:hit_point])
            .to eq original_hit_point_value
          expect(player_attributes[:attack])
            .to eq original_attack_value + Axe::PERKS[:attack]
          expect(player_attributes[:defense])
            .to eq original_defense_value + Axe::PERKS[:defense]
          expect(player_attributes[:critical])
            .to eq original_critical_value
        end
      end

      context 'knife' do
        it 'should change attributes value based Knife perks' do
          player_number_3 = Player.new('Number 3', Knife)
          player_attributes = player_number_3.informations

          expect(player_attributes[:hit_point])
            .to eq original_hit_point_value
          expect(player_attributes[:attack])
            .to eq original_attack_value + Knife::PERKS[:attack]
          expect(player_attributes[:defense])
            .to eq original_defense_value
          expect(player_attributes[:critical])
            .to eq original_critical_value + Knife::PERKS[:critical]
        end
      end

      context 'sword' do
        it 'should change attributes value based Sword perks' do
          player_number_4 = Player.new('Number 4', Sword)
          player_attributes = player_number_4.informations

          expect(player_attributes[:hit_point])
            .to eq original_hit_point_value
          expect(player_attributes[:attack])
            .to eq original_attack_value + Sword::PERKS[:attack]
          expect(player_attributes[:defense])
            .to eq original_defense_value + Sword::PERKS[:defense]
          expect(player_attributes[:critical])
            .to eq original_critical_value
        end
      end
    end
  end
end
