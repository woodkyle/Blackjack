class Game

  attr_reader :player_finish, :dealer_finish, :player, :wins, :games,
                :dealer, :deck, :player_bust, :dealer_bust

  def initialize
    @player_finish, @dealer_finish, @player_bust, @dealer_bust = false, false, false, false
    @deck = Deck.new
    @player = Hand.new([@deck.deal, @deck.deal])
    @dealer = Hand.new([@deck.deal, @deck.deal])
    run_game
  end

  def run_game
    player_turn
    dealer_turn if @player_bust == false
    check_scores if @player_bust == false && @dealer_bust == false
  end

  def player_turn
    while @player_finish == false
      @player.display_hand("Player")
      puts "Would you like to hit or stay? (H/S)"
      input = gets.chomp

      @player.add_card(@deck.deal, "Player") if input.downcase == "h"
      @player_finish = true if input.downcase == "s"

      if @player.calculate_score > 21
        @player.display_hand("Player")
        puts "Sorry, you busted with a score of: #{player.calculate_score}\n\n"
        @player_bust, @player_finish = true, true
      end
    end
  end

  def dealer_turn
    puts "\n\n"
    while @dealer_finish == false
      @dealer.display_hand("Dealer")
      @dealer.add_card(@deck.deal, "Dealer") if @dealer.calculate_score < 17
      if @dealer.calculate_score >= 17
        @dealer_finish = true
        puts "Dealer finished with:"
        @dealer.display_hand("Dealer")
      end
    end

    if dealer.calculate_score > 21
      @dealer.display_hand("Dealer")
      puts "Dealer busted with a score of: #{@dealer.calculate_score}"
      puts "You won, finishing with a score of: #{@player.calculate_score}\n\n"
      @dealer_bust, @dealer_finish = true, true
    end
  end

  def check_scores
    if @player.calculate_score > @dealer.calculate_score
      puts "Player won with a score of: #{@player.calculate_score} - #{@dealer.calculate_score}\n\n"
    elsif @dealer.calculate_score > @player.calculate_score
      puts "Dealer won with a score of: #{@dealer.calculate_score} - #{@player.calculate_score}\n\n"
    else
      puts "Game was a tie with a score of: #{@player.calculate_score} - #{@dealer.calculate_score}\n\n"
    end
  end

end
