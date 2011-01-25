Feature: Manage surveys
  In order to make a radio page
  I want to vote on and manage surveys

  
  Scenario: Do not show information about survey if none exists
    When I am on the home page
    Then I should not see "Survey"

    
  Scenario: Show last survey
    Given survey with question "What's up" and answers:
      | Nothing |
      | Something |
    Given survey with question "How are you?" and answers:
      | Fine |
      | Bad |
      | Don't know |
    When I am on the home page
    Then I should see "Survey"
    And I should see "How are you?"
    And I should see "Fine"
    And I should see "Bad"
    And I should see "Don't know"

  
  #TODO: zaznaczanie odpowiedniej odpowiedzi
  Scenario: Guest cannot vote
    Given survey with question "How are you?" and answers:
      | Fine |
      | Bad |
      | Don't know |
    When I am on the home page
    Then I choose "survey_question_answer_1"
    And I press "Vote"
    Then I should be on the new user session page

    
  Scenario: User can vote
    Given survey with question "How are you?" and answers:
      | Fine |
      | Bad |
      | Don't know |
    Given a logged in with email "proba@proba.pl"
    When I am on the home page
    Then I choose "survey_question_answer_1"
    And I press "Vote"
    Then I should see in that order:
      | Answer |
      | Votes |
      | Fine |
      | 1 |
      | Bad |
      | 0 |

      
  Scenario: User cannot create new survey
      Given a logged in with email "proba@proba.pl"
      When I am on the surveys page
      Then I should be on the home page
      And  I should see "Permission denied"

      
  Scenario: Admin create new survey
      Given a logged in admin user
      When I am on the new survey page
      Then I fill in "survey_question" with "Are you happy?"
      Then I fill in "answers_list" with "Yes\r\nNo\r\n"
      Then I press "Create Survey"
      And I should see in that order:
        | Are you happy? |
        | Yes |
        | No |
