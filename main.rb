#frozen_string_literal: true

require_relative './lib/game'

def main
  loop do
    game = Game.new
    game.new_game
    break unless another_game?
  end
end

def another_game?
  loop do
    puts 'Press 1 to play again or 2 to exit: '
    input = gets.chomp
    return true if input == '1'
    return false if input == '2'
  end
end

main