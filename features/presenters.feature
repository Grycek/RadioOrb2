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
    
  Scenario: Presenter see broadcast edit form
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast
    When I am on the edit broadcast page
    Then I should see "Edit Broadcast"
    And I should see "Probna audycja" in the "broadcast_name" input
    
  Scenario: Presenter edit broadcast
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast
    When I am on the edit broadcast page
    Then I fill in "broadcast_name" with "Probna audycja2"
    And I press "broadcast_submit"
    When I am on the broadcasts page
    Then I should see "Probna audycja2"
    
  Scenario: User can't see broadcast edit form
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    When I am on the edit broadcast page
    Then I should not be on the edit broadcast page
