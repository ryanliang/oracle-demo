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
require 'drag_and_drop_page'
require 'spec_helper'
require 'yaml'

describe GoogleHomePage do 
  let(:browser) {firefox}

  context "use partial search term" do 

    before(:each) do
      # @google_home = GoogleHomePage.new(browser, true)
      @drag_drop_page = DragAndDropPage.new(browser, true)
    end

    # it "should select auto-complete suggestion by index and click on the top search result link" do

    #   data = YAML.load_file("#{Dir.pwd}/test_data/google.yml")['auto_complete_by_index_test']

    #   @google_home.search_term = data['search_term']
    #   @google_home.select_auto_complete_by_index(data['auto_complete_index'])
    #   @google_home.click_search_result_link_by_index(data['result_link_index'])

    #   expect(@google_home.current_url).to eq(data['expected_url'])
    # end

    # it "should select auto-complete suggestion with keyword and click on the third link" do
      
    #   data = YAML.load_file("#{Dir.pwd}/test_data/google.yml")['auto_complete_by_keyword_test']

    #   @google_home.search_term = data['search_term']     
    #   @google_home.select_auto_complete_by_keyword(data['auto_complete_keyword'])
    #   @google_home.click_search_result_link_by_index(data['result_link_index'])

    #   expect(@google_home.current_url).to eq(data['expected_url'])
    # end

     it "should drag and drop" do
      

      @drag_drop_page.drag_and_drop_div_by(20, 30)
      # data = YAML.load_file("#{Dir.pwd}/test_data/google.yml")['auto_complete_by_keyword_test']



      # @google_home.search_term = data['search_term']     
      # @google_home.select_auto_complete_by_keyword(data['auto_complete_keyword'])
      # @google_home.click_search_result_link_by_index(data['result_link_index'])

      # expect(@google_home.current_url).to eq(data['expected_url'])
    end

    after(:each) do 
      # browser.quit
    end
  end
  
end