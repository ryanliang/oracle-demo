require 'page-object'

class GoogleHomePage
  include PageObject

  page_url "http://www.google.com/ncr"  # ncr forces to go to google.com without redirect

  text_field(:search_term, id: 'gbqfq')
  button(:google_instant_search, id: 'gbqfb')
  divs(:auto_complete, class: "gsq_a")
  # div(:single_auto_complete, class: "gsq_a")
  # link(:single_result_link, xpath: "//div[@class='rc']/h3/a")   
  links(:search_result_link, xpath: "//div[@class='rc']/h3/a")   

  def search_with(keyword)
    self.search_term = keyword
    self.google_instant_search
  end

  def auto_complete_suggestions
    auto_complete_elements
  end

  def search_result_links
    search_result_link_elements
  end

  def select_auto_complete_by_index(index)
    # single_auto_complete.when_present
    select_element_by_index(index, auto_complete_suggestions)
  end

  def select_auto_complete_by_keyword(keyword)
    # single_auto_complete.when_present
    select_element_by_keyword(keyword,auto_complete_suggestions)
  end

  def click_search_result_link_by_index(index)
    # single_result_link.when_present
    select_element_by_index(index, search_result_links)
  end

  def click_search_result_link_by_keyword(keyword)
    # single_result_link.when_present
    select_element_by_keyword(keyword, search_result_links)
  end
  
  private

  def select_element_by_index(index, elements)
    # self.wait_until{ elements.length > 0 }
    elements[index].click #if elements[index].when_present   
  end

  def select_element_by_keyword(keyword, elements)
    # self.wait_until{ elements.length > 0 }
    elements.each do |element|
      element.click if element.text.upcase.include? keyword.upcase
    end
  end

end