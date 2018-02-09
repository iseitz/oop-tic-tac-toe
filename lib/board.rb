class Board

  def initialize (num_rows_and_columns = 3)
    @board =   []
    num_rows_and_columns.times do
      row = []
        num_rows_and_columns.times do
          row << nil
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
        if space.nil?
          spots << '-'
        else
          spots << space
        end
      end
      board_print << spots.join(' | ') + "\n"

      if index < row.size - 1
        board_print << '-' *  spots.join(' | ').size + "\n"
      end
    end
    board_print
  end

  def add_turn(player, row_index, col_index)
    @board[row_index][col_index] = player
  end

  def has_empty_spaces?
    @board.each do |row|
      row.each do |space|
        if space.nil?
          return true
        end
      end
    end

    return false
  end

  def winner?
    @board.each do |row|
      row.each do |space|
        if !space.nil?
          if row[0] == row[1] == row[2]
            true
            space
          # elsif @board[1][0] == @board[1][1] == @board[1][2]
          #   true
          #   space
          # elsif @board[2][0] == @board[2][1] == @board[2][2]
          #   true
          #   space
          elsif @board[0][0] == @board[1][0] == @board[2][0]
            true
            space
          elsif @board[0][1] == @board[1][1] == @board[2][1]
            true
            space
          elsif @board[0][2] == @board[1][2] == @board[2][2]
            true
            space
          elsif @board[0][0] == @board[1][1] == @board[2][2]
            true
            space
          elsif @board[0][2] == @board[1][1] == @board[2][0]
            true
            space
          end
        end
        space
  end

end
