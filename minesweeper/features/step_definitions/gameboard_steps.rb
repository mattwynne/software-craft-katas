Given /^I have a (\d+) x (\d+) gameboard$/ do |width, height|
  @io = StubbedIO.new
  
  @board = GameBoard.new(
    width.to_i,
    height.to_i)
  
  @game = Game.new(@board, @io)
end

Given /^there is a mine at co\-ordinates \((\d+), (\d+)\)$/ do |x, y|
  @board.place_mine(x.to_i - 1, y.to_i - 1)
end

When /^I quit the game$/ do
  @game.quit
end

Then /^I should see the following output$/ do |expected_output|
  @io.read.should == expected_output
end
