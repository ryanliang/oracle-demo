# encoding: utf-8
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../pages/google", "./"))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "./", "./"))

# Write a program using Selenium Webdriver
# Navigates to Google.com
# Type in a partial search term and complete it using google suggestions
# Click on search then click the search result
# Use any programming language and libraries you need.

# Since we are using the auto-complete feature, we will assume Javascript is enabled

require 'selenium-webdriver'
require 'google_home_page'
require 'spec_helper'


describe GoogleHomePage do 
  let(:browser) {firefox}

  context "use partial search term" do 

    before(:each) do
      @google_home = GoogleHomePage.new(browser, true)
    end

    it "should select auto-complete suggestion by index and click on the top search result link" do
      @google_home.search_term = "selenium"
      @google_home.select_auto_complete_by_index(2)
      @google_home.click_search_result_link_by_index(0)

      expect(@google_home.current_url).to eq("http://docs.seleniumhq.org/projects/ide/")
    end

    it "should select auto-complete suggestion with keyword and click on the third link" do
      @google_home.search_term = "selenium"      
      @google_home.select_auto_complete_by_keyword("webdriver")
      @google_home.click_search_result_link_by_index(2)

      # expect(@google_home.current_url).to eq("http://docs.seleniumhq.org/")
    end

    after(:each) do 
      browser.quit
    end
  end
  
end