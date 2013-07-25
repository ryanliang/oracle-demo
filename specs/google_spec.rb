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

  context "use partial search term" do 

    before(:each) do
      @browser = Selenium::WebDriver.for :firefox
      @google_home = GoogleHomePage.new(@browser, true)
    end

    it "should select the third auto-complete suggestion and click on the top search result link" do
      @google_home.search_term = "selenium"      
      @google_home.select_auto_complete_by_index(2)
      @google_home.click_search_result_link_by_index(0)

      expect(@google_home_page.current_url).to eq("docs.seleniumhq.org/projects/ide") # use browser url instead
    end

    it "should enter a partial search term and select auto-complete suggestion with keyword" do
      @google_home.search_term = "selenium"
      @google_home.select_auto_complete_by_keyword("webdriver")      
      @google_home.click_search_result_link_by_keyword("documentation")
      
      expect(@google_home_page.current_url).to eq("http://docs.seleniumhq.org/") # use browser url instead
    end

    after(:each) do 
      @browser.quit
    end
  end
  
end