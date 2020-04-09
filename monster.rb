class Monster
  ORIGINAL_ATTRIBUTES = { hit_point: 30, attack: 3, defense: 0 }.freeze

  attr_accessor :name, :monster_type, :hit_point, :attack, :defense, :weapon

  def initialize(name, monster_type)
    @name = name
    @monster_type = monster_type
    set_attributes(ORIGINAL_ATTRIBUTES)
    calculate_monster_perks
  end

  def informations
    basic_attributes.merge(battle_attributes)
  end

  private

  def basic_attributes
    {
      name: name,
      monster_type: monster_type,
      weapon: weapon,
      description: monster_type.description,
      perks_description: monster_type.perks_descrition
    }
  end

  def battle_attributes
    {
      hit_point: hit_point,
      attack: attack,
      defense: defense
    }
  end

  def calculate_monster_perks
    perks_attributes = monster_type.calculate_perks(battle_attributes)
    set_attributes(perks_attributes)
  end

  def set_attributes(new_attributes)
    new_attributes.each do |attrib, value|
      send("#{attrib}=", value)
    end
  end
end
