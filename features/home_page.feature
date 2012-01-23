Feature: Home page

  On the home-page, I should be able to:

  Scenario: view a article
    Given a article exists titled "Test Article"
    And I am on the home page
    Then I should see "Test Article" on the page
