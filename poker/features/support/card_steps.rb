Given /^I have the cards (.*)$/ do |cards|
  @hand = Hand.new(cards)
end

When /^the hand is ranked$/ do
  @rank = @hand.rank
end

Then /^I should see "Full House"$/ do
  @rank.should == "Full House"
end
