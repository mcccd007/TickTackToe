

class Player
  attr_reader :name
  def initialize(type, name)
    @type = type
    @name = name
  end

  def pick_square
    if @type == 'ai'
      row = %w(top middle bottom).sample
      column = %w(left center right).sample
      [row, column]
    elsif @type == 'human'
      puts "#{@name}'s turn"
      puts 'Enter row'
      row = gets.chomp
      puts 'Enter column'
      column = gets.chomp
      [row, column]
    end
  end
end
