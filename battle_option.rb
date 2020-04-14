module BattleOption
  def initialize_party_type(party_number)
    puts "what type of party for party##{party_number}?"
    puts '1. Player'
    puts '2. Monster'
    party_type = gets.chomp.to_i

    return party_type if [1, 2].include? party_type

    puts 'please input a valid number 1 or 2'
    initialize_party_type
  end

  def initialize_party_number
    puts 'How many parties in the fight? '
    party_count = gets.chomp.to_i
    return party_count if party_count > 1

    puts('Please input a valid number > 1.')
    initialize_party_number
  end

  def initialize_member_number
    puts 'How many member(s) in 1 party? '
    member_count = gets.chomp.to_i
    return member_count unless member_count.zero?

    puts 'Please input a valid number.'
    initialize_member_number
  end

  def party_header(number)
    puts '============================================================'
    puts "party##{number}"
    puts '------------------------------------------------------------'
  end

  def show_all_party_informations(parties)
    parties.each do |number, party|
      party_header(number)
      party.each.with_index(1) do |member, idx|
        puts "member##{idx}"
        member.informations
        puts '------------------------------------------------------------' unless idx == party.size
      end
      party_footer
    end
  end

  def party_footer
    puts '============================================================'
    puts ''
  end

  def roll_dice(max_number)
    puts 'randomize first attacker party.'
    press_to_continue
    first_attacker = rand(1..max_number)
    first_attacker
  end

  def choose_members_to_attack(attacker_party, already_attack)
    puts 'choose member(s) to attack'
    party_size = attacker_party.size
    attacker_party.each.with_index(1) do |member, idx|
      member_information(member, idx, already_attack)
    end
    choosen_opt = gets.chomp.to_i
    attacker = attacker_party[choosen_opt - 1]
    return attacker unless invalid_member_to_attack?(choosen_opt, already_attack, party_size)

    choose_members_to_attack(attacker_party, already_attack)
  end

  def member_information(member, idx, already_attack)
    puts "#{idx}. #{member.name} #{already_attack.include?(idx) ? '#' : ''}"
  end

  # == validations ==

  def invalid_member_to_attack?(choosen_opt, already_attack, party_size)
    member_already_attack?(choosen_opt, already_attack) ||
      invalid_member?(choosen_opt, party_size)
  end

  def member_already_attack?(choosen_opt, already_attack)
    if already_attack.include?(choosen_opt)
      puts "member ##{choosen_opt} already attack."
      return true
    end
    false
  end

  def invalid_member?(choosen_opt, party_size)
    if choosen_opt < 1 || choosen_opt > party_size
      puts 'invalid options'
      return true
    end
    false
  end

  # == end of validations ==

  def choose_opponent_party(opponent_parties)
    puts 'choose party number to be attacked.'
    opponent_parties.each do |party, _member|
      puts "#{party}. party##{party}"
    end
    choosen_opt = gets.chomp.to_i
    opponent_party = opponent_parties[choosen_opt]
    return opponent_party unless opponent_party.nil?

    puts 'invalid option.'
    choose_opponent_party(opponent_parties)
  end

  def choose_opponent_member(opponent_party)
    puts 'choose opponent to be attacked.'
    opponent_party.each.with_index(1) do |member, idx|
      puts "#{idx}. #{member.name} #{member.death? ? '#death' : ''}"
    end
    choosen_opt = gets.chomp.to_i - 1
    opponent_member = opponent_party[choosen_opt]

    return opponent_member unless opponent_member.nil?

    puts 'invalid option.'
    choose_opponent_member(opponent_party)
  end

  def press_to_continue
    puts 'press any key to continue.'
    gets
  end
end
