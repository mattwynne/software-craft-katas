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
    @width, @height = width, height
    initialize_board
  end

  def initialize_board
    @board = Array.new(@height) do 
       Array.new(@width, 0) 
    end
  end
  
  def reveal_on(output)
    @board.each do |row|
      cells = row.map do |cell|
        GameBoard.display_for_cell(cell)
      end
      output.puts(cells.join)
    end
  end
  
  def self.display_for_cell(count)
    if count == 0
      '.'
    elsif count == -1
      '*'
    else
      count.to_s
    end
  end

  def place_mine(x, y)
    each_neighbour(x, y) do |dx, dy|
      if coordinates_on_board?( dx, dy ) and !is_mine?( dx, dy )
        @board[dy][dx] += 1
      end
    end
    @board[y][x] = -1    
  end
  
  def each_neighbour(x, y)
    for i in (-1..1) 
      for j in (-1..1)
        yield x + i, y + j
      end
    end
  end
  
  def is_mine?( x, y )
    @board[y][x] == -1
  end
  
  def coordinates_on_board?( x, y )
    x >= 0 and x < @width and y >= 0 and y < @height
  end
end

 