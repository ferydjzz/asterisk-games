class MonsterType
  class << self
    def calculate_perks(attributes)
      self::PERKS.each do |attrib, value|
        if attrib == :hit_point
          attributes[attrib] *= value
          next

        end

        attributes[attrib] += value
      end
      attributes
    end
  end
end
