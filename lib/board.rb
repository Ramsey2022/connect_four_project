# frozen_string_literal: true

require_relative 'custom_pieces'

# class for game grid
class Board
  include Custom_pieces

  attr_reader :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_circle} }
  end

  def display_board
    @grid.each do |row|
      puts row.join(' ')
    end
    puts (1..7).to_a.join(' ')
  end

  def update_board(row, column, symbol)
    @grid[row][column] = symbol
  end
end