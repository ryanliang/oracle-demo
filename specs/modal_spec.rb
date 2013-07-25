$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "../pages/modal", "./"))


require 'selenium-webdriver'
require 'parent_page'
require 'child_page'


describe 'ModalApp' do 

  context "use partial search term" do 

    before(:each) do
      @browser = Selenium::WebDriver.for :firefox
      @parent = ParentPage.new(@browser, true)
    end

    it "should open two modal windows and close them all" do 
      parent_win_handle = @browser.window_handle
      @parent.modal_dialog  do
        @parent.open_modal_popup      
      end

      # @parent.attach_to_window(title: "Child Window")
      # @parent.modal_dialog  do
      #   @parent.open_modal_popup      
      # end

      @child1 = ChildPage.new(@browser)
      
      @child1.attach_to_window(title: "Child Window") do
        @parent.modal_dialog  do
          p @child1.html
          @child1.open_modal_popup
        end
        # @child1.close
      end
      # # end
      # parent_win_handle = @browser.window_handle
      # p parent_win_handle
      # @parent.open_modal_popup

      
      

      # @child1 = ChildPage.new(@browser)
      # @child1.open_modal_popup
      # @browser.switch_to "Child Window"

      # @child1 = ChildPage.new(@browser)
      # @child1.open_modal_popup

    end

    
    after(:each) do 
      # @browser.quit
    end
  end
  
end