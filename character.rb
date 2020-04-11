class Character
  attr_accessor :name, :hit_point, :attack, :defense, :weapon, :critical

  def initialize
    raise 'Cannot initialize an abstract Character class'
  end

  def attack!
    return attack if weapon != Knife
    return if critical.nil?

    multiplier = rand(100) <= critical ? 2 : 1
    attack * multiplier
  end

  def informations
    basic_attributes.merge(battle_attributes)
  end

  private

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
