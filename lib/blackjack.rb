require_relative "deck"
require_relative "hand"
require_relative "card"
require_relative "game"

puts "\nWelcome to Blackjack!\n\n"
continue = true

while continue == true
  game = Game.new
  puts "Would you like to play again? (Y)"
  input = gets.chomp
  continue = false if input.downcase != "y"
end
