class Monster < Character
  ORIGINAL_ATTRIBUTES = { hit_point: 30, attack: 3, defense: 0, critical: 0 }.freeze
  NAMES = RandomNameGenerator.new(RandomNameGenerator::GOBLIN)

  attr_accessor :monster_type

  def initialize(name, monster_type)
    @name = name
    @monster_type = monster_type
    change_attributes(ORIGINAL_ATTRIBUTES)
    randomize_weapon
    calculate_monster_perks
  end

  private

  def randomize_weapon
    return if monster_type != HumanoidMonster

    self.weapon = Weapon.descendants.push(nil).sample
  end

  def basic_attributes
    super.merge(
      monster_type: monster_type,
      description: monster_type.description,
      perks_description: monster_type.perks_descrition
    )
  end

  def calculate_monster_perks
    perks_attributes = monster_type.calculate_perks(battle_attributes)
    change_attributes(perks_attributes)
  end
end
