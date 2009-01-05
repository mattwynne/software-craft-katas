Feature: Reveal Mines on Quit
  In order to reveal the solution to the puzzle
  As a player
  I want the entire board to be revealed to me when I quit the game

  Scenario: Empty minefield
    Given I have a 5 x 3 gameboard
    When I quit the game
    Then I should see the following output
      """
      .....
      .....
      .....
      """
