require 'spec'
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../')
require 'game'

When /^I ask for a gameboard (\d+) x (\d+) with 0 mines$/ do |width, height|
  MyIO = Class.new do
    def initialize
      @buffer = []
    end
    def puts(text)
      @buffer << text
    end
    def read
      @buffer.join("\n")
    end
  end
  @io = MyIO.new
  @game = Game.new(
    :output => @io,
    :width => width.to_i,
    :height => height.to_i,
    :mines => 0)
  @game.draw_field
end

Then /^I should see the following output$/ do |expected_output|
  @io.read.should == expected_output
end
