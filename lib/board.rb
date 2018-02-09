require_relative 'board_space'
require_relative 'game_turn'


class Board

  def initialize (num_rows_and_columns = 3)
    @board =   []
    num_rows_and_columns.times do
      row = []
        num_rows_and_columns.times do
          row << BoardSpace.new
        end
        @board << row
    end
  end

  def rows
    @board
  end

  def print
    board_print = ''
    @board.each_with_index do |row, index|
      spots = []
      row.each do |space|
        # if space.nil?
        #   spots << '-'
        # else
        #   spots << space
        # end
        # => this code is equivalent of the line below
        # but using the BoardSpace class
        spots << space.to_char
      end
      board_print << spots.join(' | ') + "\n"

      if index < row.size - 1
        board_print << '-' *  spots.join(' | ').size + "\n"
      end
    end
    board_print
  end

  def add_turn(player, row_index, col_index)
    @last_turn = GameTurn.new(self, player, row_index, col_index)
    @last_turn.take!
    # @board[row_index][col_index].player = player this code is equivalent of the code above BUT without
    # the turn class
  end

  def has_empty_spaces?
    @board.each do |row|
      row.each do |space|
        if !space.occupied?
          return true
        end
      end
    end

    return false
  end

  def winner?
    if @last_turn
      @last_turn.winner?
    else
      false
    end
  end

end
