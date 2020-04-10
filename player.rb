class Player < Character
  ORIGINAL_ATTRIBUTES = { hit_point: 20, attack: 5, defense: 1, critical: 0 }.freeze

  def initialize(name, weapon)
    @name = name
    @weapon = weapon
    set_attributes(ORIGINAL_ATTRIBUTES)
    calculate_weapon_perks
  end

  private

  def calculate_weapon_perks
    return if weapon.nil?

    perks_attributes = weapon.calculate_perks(battle_attributes)
    set_attributes(perks_attributes)
  end
end
