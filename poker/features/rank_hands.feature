Feature:
  In order to know the value of a player's hand
  the machine
  Should be able to recognize a rank within a hand of cards

  Scenario: Full House
    Given I have the cards KS KC JH JC JS 2D 3C
    When the hand is ranked
    Then I should see "Full House"

