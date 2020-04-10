class Weapon
  attr_accessor :attack, :defense, :critical

  class << self
    def descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def calculate_perks(attributes)
      self::PERKS.each do |attrib, value|
        attributes[attrib] += value
      end
      attributes
    end

    def name
      self.to_s
    end
  end
end
