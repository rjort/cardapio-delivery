require 'capybara'
require 'capybara/cucumber'

# Capybara::Selenium::Driver.new(app,
#                                :browser => :chrome,
#                                :driver_path => "C:\\Users\\reuter.sobrinho\\.webdriver\\chrome_driver\\bin\\chromedriver.exe"
# )

Capybara.configure do |config| 
  config.default_driver = :selenium_chrome
  config.app_host = 'http://localhost:8080'
  # config.javascript_driver = :selenium_chrome_headless
  # config.driver_path = "C:\\Users\\reuter.sobrinho\\.webdriver\\chrome_driver\\bin\\chromedriver.exe"
end
