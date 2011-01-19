Feature: Manage presenters
  In order to make a radio page
  As an admin
  I want to create and manage presenters
  
    
  Scenario: Show presenters asgined to broadcast
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast
    When I am on the home page
    And I follow "Audycje"
    And I follow "Probna audycja"
    Then I should see "Probna audycja"
    Then I should see "proba@proba.pl"
    
