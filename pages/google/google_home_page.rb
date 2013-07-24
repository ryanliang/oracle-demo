require 'page-object'

class GoogleHomePage
  include PageObject

  page_url "http://www.google.com/ncr"  # ncr forces to go to google.com without redirect

  text_field(:search_term, id: 'gbqfq')
  button(:google_instant_search, id: 'gbqfb')
  divs(:auto_complete, class: "gsq_a")
  links(:search_result_link, css: "div#ires a")
  # links(:all_link, css: 'a')

  # button(:google_search, id: 'gbqfsa')        # only when javascript is disabled
  # button(:i_am_feeling_luck, id: 'gbqfbb')


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
    self.wait_until{ auto_complete_elements.length > 0 }
    auto_complete_elements[index].click
  end

  def select_auto_complete_by_keyword(keyword)
    self.wait_until{ auto_complete_elements.length > 0 }
    auto_complete_elements.each do |element|
      element.click if element.text.upcase.include? keyword.upcase
    end
  end

end