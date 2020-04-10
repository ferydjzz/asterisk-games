class HumanoidMonster < MonsterType
  PERKS = { hit_point: 1.1, attack: 1, defense: 1 }.freeze

  class << self
    def description
      'Monster with high intelligence, can use weapons, stronger and more buff than humans'
    end

    def perks_descrition
      'hit point +10%, attack +1, defense +1'
    end

    def calculate_perks(attributes)
      perks_attributes = super
      if attributes[:weapon]
        perks_attributes = attributes[:weapon].calculate_perks(perks_attributes)
      end
      perks_attributes
    end
  end
end
