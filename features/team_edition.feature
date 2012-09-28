Feature: Creating a user

  Scenario: Team Edition
    When I navigate to ALM
    And I log in as slmadmin with password w0rk$h0p
    And I click create subscription
    And I set the subscription type to "Team_Edition"
    And I set the admin user to admin@test.com
    And I set the admin password to Password
    And I click submit for create subscription
    And I navigate to toggle features
