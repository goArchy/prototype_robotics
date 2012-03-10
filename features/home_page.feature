Feature: Home page

  On the home-page, I should be able to:

  Scenario: view a article
    Given a article exists named "Test Article"
    And I am on the home page
    Then I should see "Test Article" on the page

  Scenario: view a tutorial
    Given a tutorial exists named "Test Tutorial"
    And I am on the home page
    Then I should see "Test Tutorial" on the page

  Scenario: view a project
    Given a project exists named "Test Project"
    And I am on the home page
    Then I should see "Test Project" on the page
