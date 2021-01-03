require 'capybara'
require 'capybara/cucumber'

# Capybara::Selenium::Driver.new(app,
#                                :browser => :chrome,
#                                :driver_path => "C:\\Users\\reuter.sobrinho\\.webdriver\\chrome_driver\\bin\\chromedriver.exe"
# )

Capybara.configure do |config| 
  config.default_driver = :selenium_chrome
  # config.driver_path = "C:\\Users\\reuter.sobrinho\\.webdriver\\chrome_driver\\bin\\chromedriver.exe"
end
