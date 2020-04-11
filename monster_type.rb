class MonsterType
  class << self
    def calculate_perks(attributes)
      raise 'calculate_perks can only be called by child class' if self == MonsterType

      # this will prevent mutable attributes being changed
      attributes = attributes.dup

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
