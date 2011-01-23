Feature: Manage comments
  In order to make a radio page
  I want to have comments
  
  Scenario: Show comments sorted by creation date
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast 
    Given visible article with title "Pierwszy artykul"
    Given comment asigned to article with content "Pszczolka Maja"
    Given comment asigned to article with content "Gucio"
    Given comment asigned to article with content "Pajak"
    When I am on the article page
    Then I should see in that order:
      | Pajak |
      | Gucio |
      | Pszczolka Maja |
          
  Scenario: Create comment
      Given a logged in with email "proba@proba.pl"
      Given visible article with title "Pierwszy artykul"
      When I am on the article page
      When I fill in "comment_content" with "Pszczolka Maja"
      When I press "comment_submit"
      Then I should see "Pszczolka Maja"
      
  Scenario: Guest could not create comment
      Given a logged in with email "proba@proba.pl"
      Given visible article with title "Pierwszy artykul"
      When I am on the destroy user session page 
      When I am on the article page
      When I fill in "comment_content" with "Pszczolka Maja"
      When I press "comment_submit"
      Then I should be on the new user session page
      When I am on the article page
      Then I should not see "Pszczolka Maja"

      
  Scenario: Author can edit comment
      Given visible article with title "Pierwszy artykul"
      When I am on the destroy user session page 
      Given a logged in with email "proba2@proba.pl"
      Given comment asigned to article and user with content "Pszczolka Maja"
      When I am on the article page
      Then I should see in that order:
        | Pszczolka Maja |
        | Edit |
        | Destroy |
        | proba2@proba.pl |
      When I am on the edit_article_article_comment page
      When I fill in "comment_content" with "Gucio"
      Then I press "comment_submit"
      Then I should be on the article page
      And I should see "Gucio"
      And I should not see "Pszczolka Maja"
      
      
  Scenario: Non-Author-non-presenter cannot edit or destroy comment
      Given visible article with title "Pierwszy artykul"
      Given a logged in with email "proba@proba.pl"
      Given comment asigned to article and user with content "Pszczolka Maja"
      When I am on the destroy user session page
      Given a logged in with email "beta2@beta.pl"
      When I am on the article page
      Then I should not see "Edit"
      Then I should not see "Destroy"
      When I am on the edit_article_article_comment page
      Then I should be on the article page
      And I should see "Permission denied"
      
  Scenario: Article author can edit comments
      Given visible article with title "Pierwszy artykul"
      Given a logged in with email "beta@beta.pl"
      Given comment asigned to article and user with content "Pszczolka Maja"
      When I am on the destroy user session page
      Given a logged in with email "alfa@alfa.pl"
      Given user asigned to article
      When I am on the article page
      Then I should see in that order:
        | Pszczolka Maja |
        | Edit |
        | Destroy |
        | beta@beta.pl |
      When I am on the edit_article_article_comment page
      When I fill in "comment_content" with "Gucio"
      Then I press "comment_submit"
      Then I should be on the article page
      And I should see "Gucio"
      And I should not see "Pszczolka Maja"   
