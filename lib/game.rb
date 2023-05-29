# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'custom_pieces'

# class for game
class Game
  include Custom_pieces

  def initialize
    @board = Board.new
    @player1 = Player.new(yellow_circle)
    @player2 = Player.new(blue_circle)
    @turn = 0
  end

  def new_game
    set_player_name
    loop do
      current_player = player_turn
      @board.display_board
      column = player_input(current_player)
      @board.update_board(@board.available_row(column), column, current_player.symbol)
      break if game_over?(current_player) || draw?
    end
    @board.display_board
  end

  def player_input(player)
    loop do
      puts "#{player.symbol} #{player.name}'s turn."
      puts 'Enter column number: '
      column = gets.chomp.to_i - 1
      return column if verify_input(column)

      puts "Invalid input!/n/n"
    end
  end

  def verify_input(input)
    input.between?(0, 6) && !@board.full_column?(input)
  end

  def player_turn
    @turn += 1
    @turn.odd? ? @player1 : @player2
  end

  def ask_player_name(number)
    puts "Enter player#{number} name: "
    gets.chomp
  end

  def set_player_name
    @player1.name = ask_player_name(1)
    @player2.name = ask_player_name(2)
  end
end