# require "rubygems"
require "selenium/client"
# require "selenium/rspec/spec_helper"
# require "spec/test/unit"

describe "rc_sepcs" do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  before(:all) do
    @verification_errors = []
    @selenium_driver = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*firefox",
      :url => "http://www.mackenzieinvestments.com/",
      :timeout_in_second => 60
  end

  before(:each) do
    @selenium_driver.start_new_browser_session
  end
  
  append_after(:each) do
    @selenium_driver.close_current_browser_session
    @verification_errors.should == []
  end
  
  it "test_rc_sepcs" do
    page.open "/"
    page.type "name=code", "028"
    # page.click "name=Submit"
    page.wait_for_page_to_load "30000"
  end
end
