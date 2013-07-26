$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../pages/modal", "./"))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "./", "./"))

# Write a program using Selenium Webdriver
# Open up the "parent.htm" file in Firefox.
# Then click the "Open Modal Popup" button.
# In the pop-up, click "Open Modal Popup" again.
# Close all windows by clicking the Close buttons in the Pop-Ups
# Use any programming languages and libraries you need

require 'selenium-webdriver'
require 'parent_page'
require 'child_page'
require 'spec_helper'


describe 'ModalApp' do 
  let(:browser) {firefox}

  context "handle modal windows" do 

    before(:each) do
      # set up here
    end

    it "should open two modal windows and close them all" do
      @parent = ParentPage.new(browser, true)
      @parent.modal_dialog  do
        @parent.open_modal_popup
      end

      @child = ChildPage.new(browser)
      
      @child.attach_to_window(title: "Child Window") do
        @child.new_modal_dialog('_blank') do
          @child.open_modal_popup
        end        
      end

      2.times do
        @child.attach_to_window(title: "Child Window")
        @child.close
      end
    end
    
    after(:each) do 
      browser.quit
    end
  end
  
end