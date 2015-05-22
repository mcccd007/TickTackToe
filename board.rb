require_relative 'square.rb'
require 'pp'

class Board
  def initialize
    @squares = []
    @square_positions = []
    @board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ]
  end

  def is_square_taken?(square)
    @board[square.position.row_i][square.position.col_i] != ''
  end

  def add_new_square(square)
    @squares << square
    @square_positions << square.position
    @board[square.position.row_i][square.position.col_i] = square.type.to_s
  end

  def position_filled?(square)
    @square_positions.include? square.position ? True : False
  end

  def to_s
    %(
      ------------
      #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}
      ------------
      #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}
      ------------
      #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}
      ------------
    )
  end
end

class ScoreBoard
  def initialize
    @score = {
      top: 0,
      middle: 0,
      bottom: 0,
      left: 0,
      center: 0,
      right: 0,
      left_diaganal: 0,
      right_diaganal: 0
    }
  end

  def player_1_move(position)
    @score[position.row.to_sym] += 1
    @score[position.col.to_sym] += 1
    position.left_diaganal? { @score[:left_diaganal] += 1 }
    position.right_diaganal? { @score[:right_diaganal] += 1 }
  end

  def player_2_move(position)
    @score[position.row.to_sym] -= 1
    @score[position.col.to_sym] -= 1
    position.left_diaganal? { @score[:left_diaganal] -= 1 }
    position.right_diaganal? { @score[:right_diaganal] -= 1 }
  end

  def winner?
    PP.pp(@score)
    win = false
    @score.each do |_k, v|
      if v == 3
        win = 'player1'
      elsif v == -3
        win = 'player2'
      end
    end
    return win
  end
end
