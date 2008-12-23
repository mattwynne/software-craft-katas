Feature: title
  In order to value
  As a role
  I want feature

  Scenario: Empty minefield
    When I ask for a gameboard 5 x 3 with 0 mines
    Then I should see the following output
      """
      .....
      .....
      .....
      """
      
      


  
