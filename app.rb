require board
require square

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

  def turn(player)
    puts '#{player} turn, Enter row'
    row = gets.chomp
    puts 'Enter column'
    col = gets.chomp
    player == 'player 1' ? type = Type.new('X') : type = Type.new('O')
    square = Square.new(type, Position.new(row, col))
    @board.add_new_square(square)
    if player == 'player 1'
      @score_board.player_1_move(square.position)
    else
      @score_board.player_2_move(square.position)
    end
  end

  def next_turn
    if @turn == 1
      turn('player 1')
      @turn = 0
    else
      turn('player 2')
      @turn = 1
    end
    puts @board.to_s
  end

  def end_game(winner)
    puts 'The winner is #{winner}'
  end

  def run_game
    welcome
    while @winner == 0
      next_turn
      end_game(@score_board.winner?) if @score_board.winner?
    end
    end_game
  end
end

# Run the Game

app = App.new
app.run_game
