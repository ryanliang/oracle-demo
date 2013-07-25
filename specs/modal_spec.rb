$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../pages/modal", "./"))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "./", "./"))


require 'selenium-webdriver'
require 'parent_page'
require 'child_page'
require 'spec_helper'


describe 'ModalApp' do 
  let(:browser) {firefox}

  context "handle modal windows" do 

    before(:each) do
      @parent = ParentPage.new(browser, true)
    end

    it "should open two modal windows and close them all" do

      @parent.modal_dialog  do
        @parent.open_modal_popup
      end

      @child = ChildPage.new(@browser)
      
      @child.attach_to_window(title: "Child Window") do
        @child.new_modal_dialog('_blank') do
          @child.open_modal_popup
        end        
      end

      unless @child.attach_to_window(title: "Child Window").nil?
        @child.attach_to_window(title: "Child Window")
        @child.close
      end

    end
    
    after(:each) do 
      # tear down here.
    end
  end
  
end