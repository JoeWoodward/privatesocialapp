Feature: public facing page
  As a Prospective User
  I should be able to access a Public Facing Page
  So that I can learn about and Sign Up to the VIP Scheme

  Scenario: Prospective user visiting VIP Website should see a "Sign Up" link
    When I go to the VIP website
    Then I should see a "Sign Up" link

  Scenario: Sign up link should take user to a sign up page
    Given I am on the VIP website homepage
    When I click the "Sign Up" link
    Then I should be taken to "/sign-up"

  Scenario: Correctly filling in the "Sign Up" form should create an account and log the user in
    Given I am on the "/sign-up" page
    When I fill in my details correctly and submit them
    Then I should have an account
    And I should be logged in


  Scenario: I should be able to Log In from the VIP Websites Info Page (Home)
    Given I am on the VIP website homepage
    And I have an account
    When I fill in the Log In form and submit
    Then I should be logged in
    And should be redirected to my Account Details page

  Scenario: I should be able to edit my personal details when I'm logged in
    Given I am on the VIP website homepage
    And I have an account
    And I have signed in
    When I click the "Edit My Details" link
    Then I should be taken to "/account/joe-eastliegh/edit"
