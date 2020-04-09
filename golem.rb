class Golem
  PERKS = { hit_point: 1.2, defense: 2 }.freeze

  class << self
    def description
      'Ancient constructs very durable'
    end

    def perks_descrition
      'hit point +20%, defense +2'
    end

    define_method :calculate_perks do |*args|
      attributes = args.first
      attributes[:hit_point] *= PERKS[:hit_point]
      attributes[:defense] += PERKS[:defense]
      attributes
    end
  end
end