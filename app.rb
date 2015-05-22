require_relative 'board.rb'
require_relative 'square.rb'
require 'pp'

class App
  def initialize
    @board = Board.new
    @score_board = ScoreBoard.new
    @turn = 1
    @winner = 0
  end

  def welcome
    puts 'Welcome to Tick Tack Toe!!!'
    puts 'Get ready to play ;)'
  end

  def ask_for_input(player)
    puts "#{player}'s turn"
    puts 'Enter row'
    row = gets.chomp
    puts 'Enter column'
    col = gets.chomp
    return [row, col]
  end

  def turn(player, type)
    row, col = ask_for_input(player)
    square = Square.new(type, Position.new(row, col))
    while @board.is_square_taken?(square)
      row, col = ask_for_input(player)
      square = Square.new(type, Position.new(row, col))
    end
    @board.add_new_square(square)
    if player == 'player 1'
      @score_board.player_1_move(square.position)
    else
      @score_board.player_2_move(square.position)
    end
  end

  def next_turn
    if @turn == 1
      turn('player 1', Type.new('X'))
      @turn = 0
    else
      turn('player 2', Type.new('O'))
      @turn = 1
    end
    puts @board.to_s
  end

  def end_game(winner)
    puts "The winner is #{winner}."
  end

  def run_game
    welcome
    while @winner == 0
      next_turn
      if @score_board.winner?
        end_game(@score_board.winner?)
        @winner = 1
      end
    end
  end
end
