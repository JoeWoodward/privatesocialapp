Feature: public facing page
  In order to promote the vip area
  And to let vip member log in
  As a member of the public
  I want to see a public facing page

  Scenario: Info page
    When I go to the vip info page
    Then I should see "About harley health VIP"
