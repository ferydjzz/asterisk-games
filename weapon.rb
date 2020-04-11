class Weapon
  attr_accessor :attack, :defense, :critical

  class << self
    def descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def calculate_perks(attributes)
      raise 'calculate_perks can only be called by child class' if self == Weapon

      self::PERKS.each do |attrib, value|
        attributes[attrib] += value
      end
      attributes
    end

    def name
      raise 'name can only be called by child class' if self == Weapon

      to_s
    end
  end
end
