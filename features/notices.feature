Feature: as a VIP user I should be able to
  create notices as well as view all notices

  Background:
    Given I am on the VIP website homepage
    And I have an account
    And there are notices in the system

  Scenario: I should be able to view a list of notices
    When I am on the "/noticeboard" page
    Then I should see "Test1"
    And I should see "Test2"

  Scenario: I should be able to view a single notice
    Given I am on the "/noticeboard" page
    When I click the "more" link
    Then I should be taken to "/noticeboard/test1"

  Scenario: I should be able to create a new notice
    Given I am on the "/your/notices" page
    When I click the "New notice" link
    Then I should be taken to "/your/notices/new"


  Scenario: I should be able to view my notices
    in my account pages
    Given I have created a notice
    When I am on the "/your/notices" page
    Then I should see "My Notice"
