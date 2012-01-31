Feature: public facing page
  As a Prospective User
  I should be able to access a Public Facing Page
  So that I can learn about and Sign Up to the VIP Scheme

  Scenario: Prospective user visiting VIP website
    When I go to the VIP website
    Then I should see a "Sign Up" link

  Scenario: Sign up link should take user to a sign up page
    Given I am on the VIP website homepage
    When I click the "Sign Up" link
    Then I should be taken to "/sign-up"

  Scenario: I've filled in the details correctly on the sign up page and submitted
    Given I am on the "/sign-up" page
    When I fill in my details correctly and submit them
    Then I should have an account
    And I should be logged in

    # Scenario: VIP user visiting VIP website
    # When I go to the VIP website
    # Then I should see a login form
    # And  I should see a "Log In" link

