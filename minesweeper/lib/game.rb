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
    result = ""
    
    @board.each do |row|
      row.each do |cell|
        result += GameBoard.display_for_cell(cell)
      end
      result += "\n"
    end
    
    output.puts(result[0..-2])
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
    for i in (-1..1) 
      for j in (-1..1)
        x_plus_i = x + i
        y_plus_j = y + j
        if  coordinates_on_board?( x_plus_i, y_plus_j ) and !is_mine?( x_plus_i, y_plus_j )
          @board[y_plus_j][x_plus_i] += 1
        end
      end
    end
    @board[y][x] = -1    
  end
  
  def is_mine?( x, y )
    @board[y][x] == -1
  end
  
  def coordinates_on_board?( x, y )
    x >= 0 and x < @width and y >= 0 and y < @height
  end
end

 