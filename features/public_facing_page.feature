Feature: public facing page
  In order to promote the vip area
  And to let vip member log in
  As a member of the public
  I want to see a public facing page

  Scenario: Prospective user visiting VIP website
    When I go to the VIP website
    Then I should see a "Sign Up" link

  Scenario: Sign up link should take user to a sign up page
    Given I am on the VIP website homepage
    When I click the "Sign Up" link
    Then I should be taken to the "Sign Up" page

    # Scenario: VIP user visiting VIP website
    # When I go to the VIP website
    # Then I should see a login form
    # And  I should see a "Log In" link

