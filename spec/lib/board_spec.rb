require 'spec_helper'
require_relative'../../lib/board'

describe Board do
  it 'can be initialized with 3 rows and columns by default' do
    board = Board.new
    expect(board.rows.size).to eq(3)
    expect(board.rows[0].size).to eq(3)
  end

  it 'can be initialized with 4 rows and columns if I chose' do
    board = Board.new(4)
    expect(board.rows.size).to eq(4)
    expect(board.rows[0].size).to eq(4)
  end

  it 'prints 4 rows and columns for a 4 row board' do
    board = Board.new(4)
    board_printout =
    "- | - | - | -\n" +
    "-------------\n" +
    "- | - | - | -\n" +
    "-------------\n" +
    "- | - | - | -\n" +
    "-------------\n" +
    "- | - | - | -\n"
    expect(board.print).to eq(board_printout)
  end

  it 'prints 3 rows and columns for a 3 row board' do
    board = Board.new
    board_printout =
    "- | - | -\n" +
    "---------\n" +
    "- | - | -\n" +
    "---------\n" +
    "- | - | -\n"

    expect(board.print).to eq(board_printout)
  end

  it 'places a player on the board' do
    board = Board.new
    board.add_turn('x', 0, 0)
    board_printout =
    "x | - | -\n" +
    "---------\n" +
    "- | - | -\n" +
    "---------\n" +
    "- | - | -\n"

    expect(board.print).to eq(board_printout)
  end

  it 'places a player on the center of the board' do
    board = Board.new
    board.add_turn('o', 1, 1)
    board_printout =
    "- | - | -\n" +
    "---------\n" +
    "- | o | -\n" +
    "---------\n" +
    "- | - | -\n"
    expect(board.print).to eq(board_printout)
  end

  it 'has empty spaces when just created' do
    board = Board.new
    expect(board.has_empty_spaces?).to eq(true)
  end

  it 'has no empty spaces when completely occupied' do
    board = Board.new
    3.times do |index|
      3.times do |col_index|
        board.add_turn('x', index, col_index)
      end
    end

    expect(board.has_empty_spaces?).to eq(false)
end
