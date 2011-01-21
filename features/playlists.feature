Feature: Manage playlists
  In order to make a radio page
  I want to control playlists
  
  
  Scenario: Show playlists in order
    Given active broadcast called "Probna audycja"
    Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
    Given playlist asigned to broadcast with date "2013-01-12 21:45:00"
    Given playlist asigned to broadcast with date "2012-01-12 21:45:00"
    When I am on the broadcast page
    Then I should see in that order:
      | 2013-01-12 |
      | 2012-01-12 |
      | 2011-01-12 |
    
    
  Scenario: Presenter see playlists options
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast
    Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
    Given playlist asigned to broadcast with date "2013-01-12 21:45:00"
    When I am on the broadcast page
    Then I should see in that order:
      | New playlist |
      | Edit |
      | Destroy |
      | Edit |
      | Destroy |
      
  Scenario: User couldn't see playlists options
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
    When I am on the broadcast page
    Then I should not see "New playlist"
    And I should not see "Edit Destroy"

    
  Scenario: User should not have access to playlist options
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
    When I am on the edit broadcast_playlist page
    Then I should be on the broadcast page
    And I should see "Permission denied"
    When I am on the new broadcast_playlist page
    Then I should be on the broadcast page
    And I should see "Permission denied"
