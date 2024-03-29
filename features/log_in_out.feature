Feature: User authentication

  I should be able to create a user and log in and out

  Scenario: create a user
    Given I am on the home page
    When I click "Login"
    Then I should be on the new user registration page
    When I fill in the registration information and press submit
    Then I should be on the home page
    And I should see "Welcome test@example.com" on the page
    And I should see "Logout" on the page

  Scenario: User logs in
    Given a registered user is logged in
    Then I should be on the home page
    And I should see "Welcome test@example.com" on the page
    And I should see "Logout" on the page

  Scenario: User logs out
    Given a registered user is logged in
    When I click "Logout"
    Then I should be on the home page
    And I should see "Login" on the page


