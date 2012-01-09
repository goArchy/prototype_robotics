Feature: Home page

  On the home-page, I should be able to:

  Scenario: view a post
    Given a post exists titled "Test Post"
    And I am on the home page
    Then I should see "Test Post" on the page
