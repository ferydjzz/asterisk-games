class Character
  attr_accessor :name, :hit_point, :attack, :defense, :weapon, :critical

  def initialize
    raise 'Cannot initialize an abstract Character class'
  end

  def attack!(opponent_defense)
    damage = calculate_damage(attack, opponent_defense)

    return damage if weapon != Knife || critical.nil?

    multiplier = rand(100) <= critical ? 2 : 1
    return damage if multiplier == 1

    puts 'CRITICAL HIT!!'
    attack * multiplier
  end

  def attributes
    basic_attributes.merge(battle_attributes)
  end

  def informations
    attributes.each do |attrib, value|
      puts "#{attrib} => #{value}"
    end
  end

  def decrease_hit_point(amount)
    self.hit_point -= amount
  end

  def death?
    hit_point.zero?
  end

  private

  def calculate_damage(attack_value, defense_value)
    proportion = defense_value / attack_value
    defense_point = proportion >= 1 ? 0.5 : proportion * 0.5
    attack - attack * defense_point
  end

  def basic_attributes
    {
      name: name
    }
  end

  def battle_attributes
    {
      hit_point: hit_point,
      attack: attack,
      defense: defense,
      weapon: weapon,
      critical: critical
    }
  end

  def change_attributes(new_attributes)
    new_attributes.each do |attrib, value|
      send("#{attrib}=", value)
    end
  end
end
