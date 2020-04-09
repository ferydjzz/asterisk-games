class AnimalMonster
  PERKS = { hit_point: 1.1, attack: 1 }.freeze

  class << self
    def description
      'Corrupted animals turned into monster, retaining their body but also has more dangerous claws and fangs'
    end

    def perks_descrition
      'hit point +10%, attack +1'
    end

    define_method :calculate_perks do |*args|
      attributes = args.first
      attributes[:hit_point] *= PERKS[:hit_point]
      attributes[:attack] += PERKS[:attack]
      attributes
    end
  end
end