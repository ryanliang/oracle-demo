$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../pages/google", "./"))
# Write a program using Selenium Webdriver
# Navigates to Google.com
# Type in a partial search term and complete it using google suggestions
# Click on search then click the search result
# Use any programming language and libraries you need.

# Since we are using the auto-complete feature, we will assume Javascript is enabled

require 'selenium-webdriver'
require 'google_home_page'

describe GoogleHomePage do 

  context "Javascript Enabled" do 

    before(:each) do
      @browser = Selenium::WebDriver.for :firefox
      @google_home = GoogleHomePage.new(@browser, true)
    end

    it "should be loaded successfully" do
      expect(@google_home.current_url).to eq 'http://www.google.com/'
      expect(@google_home.title).to eq 'Google'       
    end

    after(:each) do 
      @browser.quit
    end
  end
  
end