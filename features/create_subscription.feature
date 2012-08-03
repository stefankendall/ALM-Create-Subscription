Feature: Creating a user

  Scenario: Create an admin user with RQM and RPM
    When I navigate to ALM
    And I log in as slmadmin with password w0rk$h0p
    And I click create subscription
    And I set the admin user to admin@test.com
    And I set the admin password to Password
    And I enable module "Rally Quality Manager"
    And I enable module "Rally Portfolio Manager"
    And I click submit for create subscription
    Then A subscription is created