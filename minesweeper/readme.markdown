Overall Session Goals
  * implement a simple game of minesweeper, driving everything from automated acceptance tests
  * dojo the use of cucumber for development
  * dojo the use of rspec example for unit testing
  * demonstrate how much easier refactoring is with good acceptance test coverage
  * try to demonstrate advanced features of cucumber like tables, scenario outline

Progression
  * Build something that can build an empty minefield from instructions, and report it back to us
  * Extend that to include the location of mines
  * Extend that to be able to report the danger on each square of the minefield
  * Extend that to interact with the user, taking guesses and reporting back the answer
  * Extend that to remember the user's game, so that each guess reveals part of the board.

Iteration 1

Feature: Build the minefield
  In order to visualise the gameboard where minesweeper will be played
  A player
  Should be able to ask for a gameboard of a given dimension, and have it displayed on the screen

  Scenario: Empty minefield
    When I ask for a gameboard 3 x 2 with 0 mines
    Then I should see the following output:
    |...|
    |...|

  * Learnings:
    * YAGNI: don't read vales from steps unless you need to
    * use of basic tables (what are they really called)
    * starting to code the solution in ruby
      * how will we deal with console output?
      * need to get the hang of this.

    * Use more examples to show more boards of different dimensions
    * Factor out a board at this point.
    * Refactor to use an array instead of the first-principles thing
      * Need to read up on initializeing multi-dimensional arrays in ruby

  Scenario: Minefield with 1 mine
    When I ask for a gameboard 4 x 6 with 1 mine
    Then I should see a 4 x 6 gameboard
    And the gameboard should have exactly 1 mine on it

    * Write unit tests for placement of mines
    * Factor out randomness to make sure mines go in the right place

  Scenario Outline: Minefields with multiple mines
    When I ask for a gameboard <Dimension> with <N> mines
    Then I should see a <Dimension> gameboard
    And the gameboard should have exactly <N> mines on it

  Examples:
    | Dimension | N |
    | 1 x 10    | 1 |

  * 
