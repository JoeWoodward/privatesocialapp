Feature: admin should be able to add FAQ's
  so that VIP users can view them before asking
  a new question

  Background:
    Given I am an admin user
    And I am logged in

  Scenario: as an admin user I should be
    able to create an inactive FAQ
    Given I am on the "/admin/faqs/new" page
    When I fill in FAQ details but do not check active
    Then I should see "An inactive FAQ" within "/admin/faqs"

  @javascript
  Scenario: as an admin user I should be
    able to create an active FAQ
    Given I am on the "/admin/faqs/new" page
    When I fill in FAQ details and check active
    Then I should see "An active FAQ" within "/admin/faqs"

  @javascript
  Scenario: as an admin user I should be
    able to edit a FAQ
    Given there are FAQs in the system
    And I am on the "/admin/faqs" page
    When I click the "edit" link
    Then I should be taken to "/admin/faqs/an-inactive-faq/edit"

  @javascript
  Scenario: as an admin user I should be
    able to view a notice
    Given there are FAQs in the system
    And I am on the "/admin/faqs" page
    When I click the "view" link
    Then I should be taken to "/admin/faqs/an-inactive-faq"

  @javascript
  Scenario: as a VIP user I should be able to see a list of active FAQs
    Given there are FAQs in the system
    And I am on the VIP website homepage
    And I have an account
    When I am on the "/faqs" page
    Then I should see "An active FAQ"

  @javascript
  Scenario: as a VIP user I should not
    be able to see a list of inactive FAQs
    Given there are FAQs in the system
    And I am on the VIP website homepage
    And I have an account
    When I am on the "/faqs" page
    Then I should not see "An inactive FAQ"

  Scenario: as a VIP user I should be able to ask a question
    Given I am on the VIP website homepage
    And I have an account
    When I am on the "/ask-a-question" page
    Then I should see "Your question"
