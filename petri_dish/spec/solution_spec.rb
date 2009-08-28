require 'spec'

describe "###" do
  class Cell
    def initialize(codes, index)
      @code = codes[index]
      @boundary = (index == 0) || (index + 1 == codes.length)
      @neighbours = [codes[index - 1], codes[index + 1]].map{  }
    end

    def evolve
      return @code if boundary?
      return 0 if @neighbours.all?{ |c| c.alive? }
      return 0 if @neighbours.all?{ |c| c.alive? }
      return 1 if dead? and @neighbours.all?{ |c| c.alive? }
      @code
    end

    def dead?
      !alive?
    end

    def alive?
      @code == 1
    end

    def boundary?
      @boundary
    end
  end

  class States
    def initialize(state_codes)
      @codes = state_codes
    end

    def map
      @codes.each_index{ |index| yield make_cell(index) }
    end

    def make_cell(index)
      Cell.new(@codes[index], index, self)
    end
  end

  def evolve(*states)
    States.new(states).map{ |cell| cell.evolve }
  end

  it "should kill the middle cell because it has been starved" do
    evolve(1,1,1).should == [1,0,1]
  end

  it "should die if it has no neighbours" do
    evolve(0,1,0).should == [0,0,0]
  end

  it "should give birth with 2 neighbours" do
    evolve(1,0,1).should == [1,1,1]
  end
end