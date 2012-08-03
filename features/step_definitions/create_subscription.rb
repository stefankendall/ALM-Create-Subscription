def switch_to_popup
  @driver.switch_to.window @driver.window_handles[1]
end

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
  switch_to_popup()
  @wait.until { @driver.find_element(name: 'adminUser') }
  @driver.find_element(name: 'adminUser').send_keys "admin@test.com"
end

When /^I set the admin password to (.*)/ do |password|
  @driver.find_element(name: 'password').send_keys password
  @driver.find_element(name: 'password2').send_keys password
end

When /^I enable module "(.*?)"$/ do |module_name|
  module_input = @driver.find_elements(tag_name: 'input', name: 'tagTypes').find do |input|
    input.attribute('value') == module_name
  end

  module_input.click
end

When /^I click submit for create subscription$/ do
  @driver.find_element(id: 'save_and_close_btn').click
  sleep 7
end

When /^I navigate to toggle features$/ do
  @driver.switch_to.window @main_handle
  tools_tab = @driver.find_elements(:tag_name => 'a').select {|link|
    link.text().include? 'Tools'
  }[0]
  @driver.mouse.move_to tools_tab

  toggle_link = @driver.find_elements(:class => 'rui-navigation-menu-item').select {|link|
    link.text().include? 'Toggle Features'
  }[0].attribute('href')
  @driver.navigate.to toggle_link
end

When /^And I toggle on "(.*)"$/ do |toggle_name|
  row = @driver.find_elements(:tag_name => 'tr').select { |row|
    row.text().include? toggle_name
  }[0]

  row.find_element(name: 'toggle').click()
end
