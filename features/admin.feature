Feature: as an admin user I should be able to administrate other admin users

  Background:
    Given I am an admin user
    And I am logged in

  Scenario: I should be able to view a list of users
    Given there are admin users in the system
    When I am on the "/admin/accounts" page
    Then I should see "admin.user1@mail.com"
    And I should see "admin.user2@mail.com"
    And I should see "admin@mail.com"

  Scenario: I should be able to create a new user
    Given I am on the "/admin/accounts/new" page
    When I fill in the details
    Then I should create a new admin user

  Scenario: I should be able to edit a users details
    Given there are admin users in the system
    And I am on the "/admin/accounts" page
    When I click the "edit" link
    Then I should be taken to "/admin/accounts/admin-user/edit"

  Scenario: I should be able to view a user
    Given there are admin users in the system
    And I am on the "/admin/accounts" page
    When I click the "view" link
    Then I should be taken to "/admin/accounts/admin-user"

  @javascript
  Scenario: I should be able to delete a user
    Given there are admin users in the system
    And I am on the "/admin/accounts" page
    When I click another users "delete" link
    Then the user should be deleted

