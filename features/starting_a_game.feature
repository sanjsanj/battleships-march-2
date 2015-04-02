Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Homepage
    Given I am on the homepage
    When I follow "New Game"
    Then I should see "What's your name?"

  Scenario: Don't enter name
    Given I am on the New Game page
    When I fill in "Name" with ""
    Then I should see "What's your name?"

  Scenario: Enter name
    Given I am on the New Game page
    When I fill in "Name" with "MyName"
    And click on "Submit"
    Then I expect to redirect to Start Game page

  Scenario: Start Game page
    Given I am on the Start Game page
    Then I should see a board
