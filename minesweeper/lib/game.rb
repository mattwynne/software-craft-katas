class Game
  def initialize(board, output)
    @board, @output = board, output
  end

  def quit
    @board.reveal_on(@output)
  end
  
end

class GameBoard
  def initialize(width, height)
    #TODO
  end

  def reveal_on(output)
    #TODO
  end

  def place_mine(x, y)
    #TODO
  end
end
