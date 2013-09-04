def firefox
  @browser = Selenium::WebDriver.for :firefox  
end

def google_chrome
  @browser = Selenium::WebDriver.for :chrome  
end

def ie
  @browser = Selenium::WebDriver.for :ie  
end

