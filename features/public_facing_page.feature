Feature: public facing page
  In order to promote the vip area
  And to let vip member log in
  As a member of the public
  I want to see a public facing page

  Scenario: Prospective user visiting VIP website
    When I go to the VIP website
    Then I should see a "Sign Up" link
