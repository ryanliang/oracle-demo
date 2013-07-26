# encoding: utf-8
require 'page-object'

class GoogleHomePage
  include PageObject

  page_url "http://www.google.com/ncr"  # ncr forces to go to google.com without redirect

  text_field(:search_term, id: 'gbqfq')
  button(:google_instant_search, id: 'gbqfb')
  divs(:auto_complete, class: "gsq_a")
  div(:result_column, id: "center_col")
  links(:search_result_link, xpath: "//div[@class='rc']/h3/a")
  table(:auto_complete_table, css: "table.gstl_0.gssb_c")

  def auto_complete_suggestions
    auto_complete_elements if auto_complete_table_element.when_visible    
  end

  def search_result_links
    search_result_link_elements if result_column_element.when_present
  end

  def select_auto_complete_by_index(index)
    auto_complete_suggestions[index].click
  end

  def select_auto_complete_by_keyword(keyword)
    select_element_by_keyword(keyword,auto_complete_suggestions)
    # ensure search results are returned by ajax
    self.wait_until do
      self.title.downcase.include? keyword.downcase
    end
  end

  def click_search_result_link_by_index(index)
    previous_url = self.current_url
    search_result_links[index].click
    self.wait_until do # ensure page is loaded
      self.current_url != previous_url
    end
  end

private

  def select_element_by_keyword(keyword, elements)   
    elements.each do |element|
      element.click if element.text.upcase.include? keyword.upcase
    end
  end

end