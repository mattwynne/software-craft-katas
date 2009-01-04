class Hand
  def initialize(cards_string)
    @cards = []
    cards_string.split(' ').each do |card_string|
      @cards << Card.new(card_string)
    end
  end
  def rank
    "Full House"
  end
end

class Card
  def initialize(card_string)
  end
end
