Feature: Manage comments
  In order to make a radio page
  I want to have comments
  
  Scenario: Show comments sorted by creation date
      Given active broadcast called "Probna audycja"
      Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
      Given comment asigned to playlist with content "Pszczolka Maja"
      Given comment asigned to playlist with content "Gucio"
      Given comment asigned to playlist with content "Pajak"
      When I am on the broadcast_playlist page
      Then I should see in that order:
        | Pajak |
        | Gucio |
        | Pszczolka Maja |

        
  Scenario: Create comment
      Given a logged in with email "proba@proba.pl"
      Given active broadcast called "Probna audycja"
      Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
      When I am on the broadcast_playlist page
      When I fill in "comment_content" with "Pszczolka Maja"
      When I press "comment_submit"
      Then I should see "Pszczolka Maja"

      
  Scenario: Guest could not create comment
      Given active broadcast called "Probna audycja"
      Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
      When I am on the broadcast_playlist page
      When I fill in "comment_content" with "Pszczolka Maja"
      When I press "comment_submit"
      Then I should be on the new user session page
      When I am on the broadcast_playlist page
      Then I should not see "Pszczolka Maja"

      
  Scenario: Author can edit comment
      Given a logged in with email "proba@proba.pl"
      Given active broadcast called "Probna audycja"
      Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
      Given comment asigned to playlist and user with content "Pszczolka Maja"
      When I am on the broadcast_playlist page
      Then I should see in that order:
        | Pszczolka Maja |
        | Edit |
        | Destroy |
        | proba@proba.pl |
      When I am on the edit_broadcast_broadcast_playlist_comment page
      When I fill in "comment_content" with "Gucio"
      Then I press "comment_submit"
      Then I should be on the broadcast_playlist page
      And I should see "Gucio"
      And I should not see "Pszczolka Maja"
      

  Scenario: Non-Author-non-presenter cannot edit or destroy comment
      Given a logged in with email "proba@proba.pl"
      Given active broadcast called "Probna audycja"
      Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
      Given comment asigned to playlist and user with content "Pszczolka Maja"
      When I am on the destroy user session page
      Given a logged in with email "beta@beta.pl"
      When I am on the broadcast_playlist page
      Then I should not see "Edit"
      Then I should not see "Destroy"
      When I am on the edit_broadcast_broadcast_playlist_comment page
      Then I should be on the broadcast_playlist page
      And I should see "Permission denied"    

      
  Scenario: Presenter can edit comments
      Given active broadcast called "Probna audycja"
      Given playlist asigned to broadcast with date "2011-01-12 21:45:00"
      Given a logged in with email "beta@beta.pl"
      Given comment asigned to playlist and user with content "Pszczolka Maja"
      When I am on the destroy user session page
      Given a logged in with email "alfa@alfa.pl"
      Given asigned user to broadcast
      When I am on the broadcast_playlist page
      Then I should see in that order:
        | Pszczolka Maja |
        | Edit |
        | Destroy |
        | beta@beta.pl |
      When I am on the edit_broadcast_broadcast_playlist_comment page
      When I fill in "comment_content" with "Gucio"
      Then I press "comment_submit"
      Then I should be on the broadcast_playlist page
      And I should see "Gucio"
      And I should not see "Pszczolka Maja"
      
  #tODO: usuwanies
