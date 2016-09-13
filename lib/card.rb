class Card

  attr_reader :rank, :suit

  def initialize(rank, suit)
      @rank, @suit = rank, suit
  end

  def is_face?
    @rank == "J" || @rank == "Q" || @rank == "K"
  end

  def is_ace?
    @rank == "A"
  end

  def get_string
    "#{rank}#{suit}"
  end

end
