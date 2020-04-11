class AnimalMonster < MonsterType
  PERKS = { hit_point: 1.1, attack: 1 }.freeze

  class << self
    def description
      'Corrupted animals turned into monster,
      retaining their body but also has more dangerous claws and fangs'
    end

    def perks_descrition
      'hit point +10%, attack +1'
    end
  end
end
