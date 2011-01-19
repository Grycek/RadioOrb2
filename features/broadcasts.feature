Feature: Manage Broadcast
  In order to make a radio page
  As an admin
  I want to create and manage broadcasts
  
    
  Scenario: Active broadcast show
    When I am on the home page
    Given active broadcast called "Probna audycja"
    And I follow "Audycje"
    Then I should see "Probna audycja"
    
  Scenario: Inactive broadcast invisibility
    When I am on the home page
    Given inactive broadcast called "Probna audycja"
    And I follow "Audycje"
    Then I should not see "Probna audycja"
    
