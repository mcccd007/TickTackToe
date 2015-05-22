require_relative 'board.rb'
require_relative 'square.rb'
require 'pp'

class App
  def initialize(*players)
    @board = Board.new
    @score_board = ScoreBoard.new
    @turn = 1
    @winner = 0
    @players = players
  end

  def welcome
    puts 'Welcome to Tick Tack Toe!!!'
    puts 'Get ready to play ;)'
  end

  def turn(player, type)
    begin
      row, col = player.pick_square
      square = Square.new(type, Position.new(row, col))
    rescue
      puts "Check your spelling dummy"
      row, col = player.pick_square
      square = Square.new(type, Position.new(row, colgit 
    end
    while @board.is_square_taken?(square)
      row, col = player.pick_square
      square = Square.new(type, Position.new(row, col))
    end
    @board.add_new_square(square)
    if player == @players[0]
      @score_board.player_1_move(square.position)
    else
      @score_board.player_2_move(square.position)
    end
  end

  def next_turn
    if @turn == 1
      turn(@players[0], Type.new('X'))
      @turn = 0
    else
      turn(@players[1], Type.new('O'))
      @turn = 1
    end
    puts @board.to_s
  end

  def end_game(winner)
    puts "The winner is #{@players[winner].name}."
    puts @board.to_s
    #PP.pp(@board)
  end

  def run_game
    welcome
    while @winner == 0
      if @board.is_finished?
        puts 'booom'
        exit
      end
      next_turn
      if @score_board.winner?
        end_game(@score_board.winner?)
        @winner = 1
      end
    end
  end
end
