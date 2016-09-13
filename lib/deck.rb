class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :cards

  def initialize
    @cards = []
    construct
  end

  def construct
    SUITS.each {|suit| RANKS.each {|rank| @cards << Card.new(rank, suit)}}
    @cards.shuffle!
  end

  def deal
    @cards.pop
  end

end
