require_relative '../lib/game'

puts "Number of Players?"
player_count = gets.chomp


game = Candyland.new(player_count)
game.play_game()






