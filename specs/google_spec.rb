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

    it "should enter a search term and select the third auto-complete" do
      @google_home.search_term = "selenium"
      @google_home.select_auto_complete_by_index(2)

      full_search_term =  @google_home.auto_complete_suggestions[2]
      # @google_home.search_result_links[0].text.upcase 
    end

    after(:each) do 
      @browser.quit
    end
  end
  
end