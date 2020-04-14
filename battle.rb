require './dependecy_installer'
require './battle_option'

class Battle
  include BattleOption

  BATTLE_EFFECT = %w[Aarrgghh Waacahhh Pleetokk Hiiyyaaaa Grrr].freeze

  attr_accessor :parties, :party_count, :member_count, :weapon_collections, :monster_collections

  def initialize
    self.party_count = initialize_party_number
    self.member_count = initialize_member_number
    self.parties = {}
    self.weapon_collections = Weapon.descendants
    self.monster_collections = MonsterType.descendants

    (1..party_count).each do |party_number|
      party_type = initialize_party_type(party_number)
      parties[party_number] = initialize_party_members(party_type, member_count)
    end
    show_all_party_informations(parties)
  end

  def fight
    attacker = roll_dice(party_count)
    loop do
      already_attack = []
      attacker_party = parties[attacker]
      opponent_parties = parties.reject { |party| party == attacker }
      puts "party##{attacker} attack!"
      (1..member_count).each do
        attacker_member = choose_members_to_attack(attacker_party, already_attack)
        already_attack << attacker_member
        opponent_party = choose_opponent_party(opponent_parties)
        oppenent_member = choose_opponent_member(opponent_party)
        clash(attacker_member, oppenent_member)
      end
      attacker = attacker == party_count ? 1 : attacker + 1
    end
  end

  private

  def clash(attacker, defender)
    puts '========================'
    puts defender.hit_point
    puts "#{attacker.name} attack #{defender.name} !!!"
    puts Battle::BATTLE_EFFECT.sample
    defender.decrease_hit_point(attacker.attack!(defender.defense))
    puts defender.hit_point
    puts '========================'
    press_to_continue
  end

  def initialize_party_members(party_type, member_count)
    if party_type == 1
      initialize_player(member_count)
    else
      initialize_monster(member_count)
    end
  end

  def initialize_player(member_count)
    players = []
    (1..member_count).each do
      players << Player.new(Player::NAMES.compose(rand(2..3)), weapon_collections.sample)
    end
    players
  end

  def initialize_monster(member_count)
    monsters = []
    (1..member_count).each do
      monsters << Monster.new(Monster::NAMES.compose(rand(1..3)), monster_collections.sample)
    end
    monsters
  end
end
