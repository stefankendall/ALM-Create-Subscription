When /^I navigate to ALM$/ do
  @driver.navigate.to 'http://localhost:7001'
end

When /^I log in as (.*?) with password (.*)$/ do |username, password|
  @driver.find_element(id: 'j_username').send_keys username
  @driver.find_element(id: 'j_password').send_keys password
  @driver.find_element(id: 'login_button').click
end

When /^I click create subscription$/ do
  @wait.until { @driver.find_element(id: 'do') }
  @driver.mouse.move_to(@driver.find_element(id: 'do'))
  @driver.find_element(id: 'new').click
end

When /^I set the admin user to (.*)$/ do |user_name|
  @wait.until { @driver.find_element(name: 'adminUser') }
  @driver.find_element(name: 'adminUser').send_keys user_name
end

When /^I set the admin password to (.*)/ do |password|
  @driver.find_element(name: 'password').send_keys password
  @driver.find_element(name: 'password2').send_keys password
end

When /^I click submit for create subscription$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^A subscription is created$/ do
  pending # express the regexp above with the code you wish you had
end