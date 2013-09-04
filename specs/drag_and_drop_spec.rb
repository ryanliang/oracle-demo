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
require 'drag_and_drop_page'
require 'spec_helper'
require 'yaml'

describe DragAndDropPage do 
  let(:browser) {ie}

  context "use partial search term" do 

    before(:each) do
      @drag_and_drop_page = DragAndDropPage.new(browser, true)
    end


    it "should select auto-complete suggestion with keyword and click on the third link" do
      
      

      @drag_and_drop_page.drag_and_drop_div_by(50,50)

      
    end

    after(:each) do 
      browser.quit
    end
  end
  
end