Feature: as a VIP user I should be able to view events

  Background:
    Given an admin user has logged in
    And there are events in the system
    And I am on the VIP website homepage
    And I have an account

  Scenario: I want to see a list of events.
    When I am on the "/events" page
    Then I should see "Test1"
    And I should see "Test2"

  Scenario: I should be able to click
    more to see a single view of the event
    Given I am on the "/events" page
    When I click the "more" link
    Then I should be taken to "/events/test1"

  @javascript
  Scenario: as a VIP user I should be able to RSVP an event
    Given I am on the "/events/test1" page
    When I click the "RSVP" link
    Then I should see a confirmation box
    And I should be taken to "/events"

  @javascript
  Scenario: I should be able to cancel the RSVP
    Given I have RSVP'd to an event
    And I am on the "/events/test1" page
    When I click the "Cancel RSVP" link
    Then I should be taken to "/events"

  @javascript
  Scenario: as a VIP user I should be able to see
    my events within my account page
    Given I have RSVP'd to an event
    When I am on the "/your/events" page
    Then I should see "test1"
