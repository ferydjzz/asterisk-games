require_relative 'battle'
require_relative 'character'
require_relative 'monster'
require_relative 'player'
require_relative 'monster_type'
require_relative 'monster_types/golem'
require_relative 'monster_types/animal_monster'
require_relative 'monster_types/humanoid_monster'
require_relative 'weapon'
require_relative 'weapons/axe'
require_relative 'weapons/knife'
require_relative 'weapons/sword'

puts 'Game Started'

a = Battle.new
a.fight
