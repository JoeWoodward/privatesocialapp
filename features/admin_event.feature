Feature: as an admin user I should be able to administer events

  Background:
    Given I am an admin user
    And I am logged in

  Scenario: I should be able to create a new event
    Given I am on the "/admin/events/new" page
    When I fill in the event details
    Then I should create a new event

  Scenario: I should be able to see a list of events
    Given there are events in the system
    When I am on the "/admin/events" page
    Then I should see "Test1"
    And I should see "Test2"
    And I should see "Test3"

  Scenario: I should be able to edit an events details
    Given there are events in the system
    And I am on the "/admin/events" page
    When I click the "edit" link
    Then I should be taken to "/admin/events/test1/edit"

  Scenario: I should be able to view a notice
    Given there are events in the system
    And I am on the "/admin/events" page
    When I click the "view" link
    Then I should be taken to "/admin/events/test1"

  @javascript
  Scenario: I should be able to delete an event
    Given there are events in the system
    And I am on the "/admin/events" page
    When I click the "delete" link
    And confirm the alert
    Then the event should be deleted
