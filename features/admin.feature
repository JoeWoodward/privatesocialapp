Feature: As an admin I want to be able to manage administrators
  from an admin dashboard

  Background: I am a logged user
    Given I am already an admin member
    And I am logged in

  Scenario: I want to create a new admin account
    When I go to the "/admin/accounts/new" page
    And I fill in the details for a new account
    Then I should create a new account

  Scenario: I should be able to edit my personal details when I'm logged in
    When I go to the "/admin/accounts/joe-woodward" page
    And I click the "Edit My Details" link
    Then I should be taken to "/admin/accounts/joe-woodward/edit"

  Scenario: I want to view a list of administrators
    When I go to the "/admin/accounts" page
    And There are admin users
    Then I should see a list of users
