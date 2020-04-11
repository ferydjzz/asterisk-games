class MonsterType
  class << self
    def calculate_perks(attributes)
      raise 'calculate_perks can only be called by child class' if self == MonsterType

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
