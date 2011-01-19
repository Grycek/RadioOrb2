Feature: Admin panel
  In order to manage radio page
  As an admin
  I want to have an access to admin panel
  
  Scenario: Admin login
    Given a logged in admin user
    And I am on the rails admin dashboard page
    Then I should see "Site administration"
    And I should be on the rails admin dashboard page
    
  Scenario: User access denied
    Given a logged in with email "proba@proba.pl"
    And I am on the rails admin dashboard page
    Then I should not see "Site administration"
    And I should be on the home page
    
  Scenario: Guest access denied
    Given I am on the rails admin dashboard page
    Then I should not see "Site administration"
