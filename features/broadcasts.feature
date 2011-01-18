Feature: Manage Broadcast
  In order to make a radio page
  As an admin
  I want to create and manage broadcasts
  
  Scenario: Admin login
    Given a logged in admin user
    Then I should not see "Forgot your password?"
    
  Scenario: Broadcast show
    When I am on the home page
    Given broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    And I follow "Audycje"
    Then I should see "Probna audycja"
    
