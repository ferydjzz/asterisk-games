class Player < Character
  ORIGINAL_ATTRIBUTES = { hit_point: 20, attack: 5, defense: 1, critical: 0 }.freeze
  NAMES = RandomNameGenerator.new(RandomNameGenerator::ROMAN)

  def initialize(name, weapon)
    @name = name
    @weapon = weapon
    change_attributes(ORIGINAL_ATTRIBUTES)
    calculate_weapon_perks
  end

  private

  def calculate_weapon_perks
    return if weapon.nil?

    perks_attributes = weapon.calculate_perks(battle_attributes)
    change_attributes(perks_attributes)
  end
end
