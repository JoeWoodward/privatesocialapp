Feature: As an admin user I should be able to administer the notices
  Background:
    Given I have an account
    And there are notices in the system
    And I am an admin user
    And I am logged in

  Scenario: I should be able to see a list of all notices
    When I am on the "/admin/notices" page
    Then I should see "Test1"
    And I should see "Test2"
    And I should see "Test3"

  Scenario: I should be able to view a notice
    Given I am on the "/admin/notices" page
    When I click the "view" link
    Then I should be taken to "/admin/notices/test1"

  @javascript
  Scenario: I should be able to delete a notice
    Given there are notices in the system
    And I am on the "/admin/notices" page
    When I click the "delete" link
    And confirm the alert
    Then the notice should be deleted
