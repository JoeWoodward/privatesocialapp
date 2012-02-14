Feature: admin should be able to add offers
  so VIP users can view them, they should also be able
  to mark them as active(viewable)

  Background:
    Given I am an admin user
    And I am logged in

  Scenario: as an admin user I should be
    create an inactive offer
    Given I am on the "/admin/offers/new" page
    When I fill in offers details but do not check active
    Then I should see "An inactive offer" within "/admin/offers"

  @javascript
  Scenario: as an admin user I should be
    able to create an active offer
    Given I am on the "/admin/offers/new" page
    When I fill in offers details and check active
    Then I should see "An active offer" within "/admin/offers"

  Scenario: as an admin user I should be able to
    see a list of all the offers
    Given there are offers in the system
    When I am on the "/admin/offers" page
    Then I should see "an offer"
    And I should see "another offer"
    And I should see "yet another offer"
    And I should see "true"

  Scenario: as an admin user I should be able to edit an offer
    Given there are offers in the system
    And I am on the "/admin/offers" page
    When I click the "edit" link
    Then I should be taken to "/admin/offers/an-offer/edit"

  Scenario: as an admin user I should
    be able to view an edit
    Given there are offers in the system
    And I am on the "/admin/offers" page
    When I click the "view" link
    Then I should be taken to "/admin/offers/an-offer"

  Scenario: as a VIP user I should be
    able to view the current offers
    Given there are offers in the system
    And I have an account
    When I am on the "/offers" page
    Then I should see "an offer"
    And I should see "another offer"
