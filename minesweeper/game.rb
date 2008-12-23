class Game
  def initialize(opts)
    parse(opts)
  end

  def draw_field
    @field.draw_on(@output)
  end

  private

  def parse(opts)
    @output = opts[:output]
    @field = Field.new(
      opts[:width], 
      opts[:height],
      opts[:mines])
  end
end

class Field
  def initialize(width, height, num_mines)
    @rows = Array.new(height) do |y|
      Array.new(width) do |x|
        EmptySquare.new(Location.new(x,y, self))
      end
    end
    num_mines.times do
      place_bomb
    end
  end

  def draw_on(output)
    @rows.each do |row|
      output.puts row.map{ |sq| sq.render }.join('')
    end
  end

  def bombed?(x,y)
    return false if x < 0 or y < 0 
    return false if x > width - 1 or y > height - 1 
    @rows[y][x].bombed?
  end

  private 

  def place_bomb
    x = (rand * width).to_i
    y = (rand * height).to_i
    @rows[y][x] = Bomb.new(Location.new(x,y, self))
  end

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
  def nearby_bombs
    bomb_count = 0
    nearby_locations.each do |location|
      bomb_count += 1 if location.bombed?
    end
    bomb_count
  end
  protected
  
  def bombed?
    @field.bombed?(x,y)
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
    nearby_bombs = @location.nearby_bombs
   return '.' if nearby_bombs == 0
    nearby_bombs
  end
  
  def bombed?
    false
  end
end

class Bomb < Square
  def render
    '*'
  end
  def bombed?
    true
  end
end

# game = Game.new(
#   :output => Kernel,
#   :width => 10,
#   :height => 15,
#   :mines => 7)
# game.draw_field
# 
