class Golem < MonsterType
  PERKS = { hit_point: 1.2, defense: 2 }.freeze

  class << self
    def description
      'Ancient constructs very durable'
    end

    def perks_descrition
      'hit point +20%, defense +2'
    end
  end
end
