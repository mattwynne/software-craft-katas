class Game
  def initialize(board, output)
    @board, @output = board, output
  end

  def quit
    @board.reveal_on(@output)
  end
end

class Cell
  def initialize
    @state = 0
  end
      
  def mine?
    @state == -1
  end
  
  def mine!
    @state = -1
  end
  
  def DANGER!
    @state += 1 unless mine?
  end
  
  def to_s
    if @state == 0
      '.'
    elsif @state == -1
      '*'
    else
      @state.to_s
    end
  end
end

class GameBoard
  def initialize(width, height)
    @width, @height = width, height
    initialize_board
  end

  def initialize_board
    @board = Array.new(@height) do 
       Array.new(@width) {Cell.new} 
    end
  end
  
  def reveal_on(output)
    @board.each do |row|
      output.puts(row.join)
    end
  end
  
  def cell(x, y)
    @board[y][x]
  end
  
  def place_mine(x, y)
    each_neighbour(x, y) do |neighbour|
      neighbour.DANGER!
    end
    cell(x, y).mine!
  end
  
  def each_neighbour(x, y)
    for i in (-1..1) 
      for j in (-1..1)
        yield cell(x + i, y + j) if coordinates_on_board?( x + i, y + j )
      end
    end
  end
  
  def coordinates_on_board?( x, y )
    x >= 0 and x < @width and y >= 0 and y < @height
  end
end

 