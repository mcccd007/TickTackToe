require_relative 'app.rb'
require_relative 'player'

# Run the Game
player1 = Player.new('ai', 'Bob')
player2 = Player.new('ai', 'death machine')
app = App.new(player1, player2)
app.run_game
