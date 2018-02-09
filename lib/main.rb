# -Game
# - Board
# - Spots
# - Players
require_relative 'player'
require_relative 'board'
require_relative 'game_turn'
require_relative 'board_space'

board = Board.new
x_player = Player.new('x')
o_player = Player.new('o')

players = [x_player, o_player].shuffle
turn_index = 0
while board.has_empty_spaces? && !board.winner?
   current_player = players[turn_index]
   puts "It is #{current_player.character} turn"

   print "What row do you want to play?"
   row_index = gets.chomp.to_i

   print "What column do you want tp play?"
   col_index = gets.chomp.to_i

   board.add_turn(current_player, row_index, col_index)
   puts board.print

   turn_index = turn_index == 0 ? 1 : 0
end
puts "The player #{current_player.character} wins the game!"
