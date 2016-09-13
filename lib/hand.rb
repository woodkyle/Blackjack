class Hand

  attr_reader :cards

  def initialize(cards = [])
    @cards = cards
  end

  def add_card(card, player)
    @cards << card
    puts "#{player} drew: #{card.get_string}\n\n"
  end

  def display_hand(player)
    @cards.each { |card| puts "#{player} has: #{card.get_string}" }
    puts "#{player} score: #{calculate_score}\n\n"
  end

  def calculate_score
    score = 0
    aces_count = 0
    @cards.each do |card|
      score += card.rank.to_i
      score += 10 if card.is_face?
      if card.is_ace?
        score += 11
        aces_count += 1
      end
    end
    fix_aces(score, aces_count)
  end

  def fix_aces(sum, aces)
    while sum > 21 && aces > 0
      sum -= 10
      aces -= 1
    end
    sum
  end

end
