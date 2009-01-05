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
    @rows = Array.new(height) do |y|
      Array.new(width) do |x|
        EmptySquare.new(Location.new(x,y, self))
      end
    end
  end

  def reveal_on(output)
    @rows.each do |row|
      output.puts row.map{ |sq| sq.render }.join('')
    end
  end

  def mined?(x,y)
    return false if x < 0 or y < 0 
    return false if x > width - 1 or y > height - 1 
    @rows[y][x].mined?
  end

  def place_mine(x, y)
    @rows[y][x] = Mine.new(Location.new(x,y, self))
  end

  private 

  def width
    @rows[0].length
  end

  def height
    @rows.length
  end
end

class Location
  attr_reader :x, :y
  def initialize(x, y, field)
    @x, @y, @field = x, y, field
  end
  def nearby_mines
    bomb_count = 0
    nearby_locations.each do |location|
      bomb_count += 1 if location.mined?
    end
    bomb_count
  end
  protected
  
  def mined?
    @field.mined?(x,y)
  end
  
  private
  
  def nearby_locations
    [
      Location.new(x - 1, y - 1, @field),
      Location.new(x    , y - 1, @field),
      Location.new(x + 1, y - 1, @field),
      Location.new(x + 1, y    , @field),
      Location.new(x + 1, y + 1, @field),
      Location.new(x    , y + 1, @field),
      Location.new(x - 1, y + 1, @field),
      Location.new(x - 1, y    , @field),
    ]
  end
  def x
    @x
  end
  def y
    @y
  end
end

class Square
  def initialize(location)
    @location = location
  end
end

class EmptySquare < Square
  def render
    nearby_mines = @location.nearby_mines
    return '.' if nearby_mines == 0
    nearby_mines
  end
  
  def mined?
    false
  end
end

class Mine < Square
  def render
    '*'
  end
  def mined?
    true
  end
end
