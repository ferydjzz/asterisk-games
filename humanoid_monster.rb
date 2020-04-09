class HumanoidMonster
  PERKS = { hit_point: 1.1, attack: 1, defense: 1 }.freeze

  class << self
    def description
      'Monster with high intelligence, can use weapons, stronger and more buff than humans'
    end

    def perks_descrition
      'hit point +10%, attack +1, defense +1'
    end

    define_method :calculate_perks do |*args|
      attributes = args.first
      attributes[:hit_point] *= PERKS[:hit_point]
      attributes[:attack] += PERKS[:attack]
      attributes[:defense] += PERKS[:defense]
      attributes
    end
  end
end