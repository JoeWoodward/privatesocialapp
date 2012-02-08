Feature: As an admin user I should be able to administer the notices
  Background:
    Given I am an admin user
    And I am logged in

  Scenario: I should be able to see a list of all notices
    Given there are notices in the system
    When I am on the "/admin/notices" page
    Then I should see "test1"
    And I should see "test2"
    And I should see "test3"

  Scenario: I should be able to create a new notice
    Given I am on the "/admin/notices/new" page
    When I fill in the notice details
    Then I should create a new notice

  Scenario: I should be able to edit a users details
    Given there are notices in the system
    And I am on the "/admin/notices" page
    When I click the "edit" link
    Then I should be taken to "/admin/notices/test1/edit"

  Scenario: I should be able to view a notice
    Given there are notices in the system
    And I am on the "/admin/notices" page
    When I click the "view" link
    Then I should be taken to "/admin/notices/test1"

  @javascript
  Scenario: I should be able to delete a notice
    Given there are notices in the system
    And I am on the "/admin/notices" page
    When I click the "delete" link
    And confirm the alert
    Then the notice should be deleted
