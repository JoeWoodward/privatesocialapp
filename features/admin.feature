Feature: As an admin I want to be able to administrate the site
  from an admin dashboard

  Scenario: I want to create a new admin account
    Given I am already an admin member
    And I am logged in
    When I go to the "/admin/account/new" page
    And I fill in the details for a new account
    Then I should create a new account
