Feature: Manage articles
  In order to make a radio page
  As a radio presenter
  I want to create and manage articles
  
  Scenario: Articles sorted
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast 
    Given visible article with title "Pierwszy artykul"
    Given user asigned to article
    Given visible article with title "Drugi artykul"
    Given user asigned to article
    When I am on the articles page
    Then I should see in that order:
        | Pierwszy artykul |
        | Drugi artykul |

        
  Scenario: Presenter create article
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast 
    When I am on the presenters page
    Then I follow "New Article"
    And I fill in "article_title" with "Artykul probny"
    And I fill in "article_shortcontent" with "Probny skrot"
    And I fill in "article_content" with "Probna tresc"
    And I press "article_submit"
    And I should see "Successfully created article"

  Scenario: User cannot create article
    Given a logged in with email "proba@proba.pl"
    When I am on the new article page
    Then I should be on the home page
    And I should see "Permission denied"
    
  Scenario: Guest cannot create article
    When I am on the new article page
    Then I should be on the home page
    And I should see "Permission denied"
    
  Scenario: Presenter edit artcile
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast 
    Given visible article with title "Pierwszy artykul"
    Given user asigned to article
    When I am on the edit_article page
    And I fill in "article_title" with "Drugi Artykul"
    And I press "article_submit"
    When I am on the articles page
    Then I should see "Drugi Artykul"
    
  Scenario: User cannot edit article
    Given active broadcast called "Probna audycja"
    Given a logged in with email "proba@proba.pl"
    Given asigned user to broadcast 
    Given visible article with title "Pierwszy artykul"
    Given user asigned to article
    When I am on the destroy user session page  
    Given a logged in with email "proba2@proba.pl"
    When I am on the edit_article page
    Then I should be on the home page
    And I should see "Permission denied"    
