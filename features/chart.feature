Feature: Chart
  In order to make a radio page
  I want to vote on and manage chart
  
  Scenario: If chart does not exist, show information
      Given a logged in with email "proba@proba.pl"
      When I am on the new vote page
      Then I should see "Voting for chart not opened"
      
  Scenario: Guest cannot vote on chart
      When I am on the new vote page
      Then I should be on the new user session page
      
  Scenario: User can vote on the chart once
      Given a logged in with email "proba@proba.pl"
      Given new chart
      Given 11 active songs
      When I am on the new vote page
      Then I vote for 1 songs
      And I press "Vote"
      When I am on the new vote page
      And I should see "Thank you"
      
  Scenario: User cannot vote on the chart for more than 10 songs
      Given a logged in with email "proba@proba.pl"
      Given new chart
      Given 15 active songs
      When I am on the new vote page
      Then I vote for 11 songs
      And I press "Vote"
      And I should see "Too many votes"
      Then I vote for 1 songs
      And I press "Vote"
      And I should see "Thank you"
    
  Scenario: User can vote on the new chart
      Given a logged in with email "proba@proba.pl"
      Given new chart
      Given 11 active songs
      When I am on the new vote page
      Then I vote for 1 songs
      And I press "Vote"
      And I should see "Thank you"
      Given new chart
      When I am on the new vote page
      Then I vote for 1 songs
      And I press "Vote"
      And I should see "Thank you"
  
  #TODO: zamykanie notowania i zwiekszanie sie liczby oddanych glosow
