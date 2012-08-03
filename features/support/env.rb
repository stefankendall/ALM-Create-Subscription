require 'selenium-webdriver'

$LOAD_PATH << File.expand_path('../../../lib', __FILE__)

Before do
  @driver = Selenium::WebDriver.for :chrome, :switches => %w[--allow-file-access-from-files --disable-web-security]
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  @main_handle = @driver.window_handle
end

After do
  @driver.quit
end
