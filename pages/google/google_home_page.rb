require 'page-object'

class GoogleHomePage
  include PageObject

  page_url "http://www.google.com/ncr"  # ncr forces to go to google.com without redirect

  text_field(:search_term, id: 'gbqfq')
  button(:google_instant_search, id: 'gbqfb')
  divs(:auto_complete, class: "gsq_a")
  div(:result_column, id: "center_col")
  link(:single_result_link, xpath: "//div[@class='rc']/h3/a")   
  links(:search_result_link, xpath: "//div[@class='rc']/h3/a")
  table(:auto_complete_table, css: "table.gstl_0.gssb_c")

  # def search_with(keyword)
  #   self.search_term = keyword
  #   self.google_instant_search
  # end

  def auto_complete_suggestions
    auto_complete_elements if auto_complete_table_element.when_visible    
  end

  def search_result_links
    search_result_link_elements if result_column_element.when_visible
  end

  def select_auto_complete_by_index(index)
    select_element_by_index(index, auto_complete_suggestions)
  end

  def select_auto_complete_by_keyword(keyword)
    select_element_by_keyword(keyword,auto_complete_suggestions)
  end

  def click_search_result_link_by_index(index)
    select_element_by_index(index, search_result_links)
  end

  def click_search_result_link_by_keyword(keyword)
    # search_result_links.each do |link|
    #   p link.text
    # end
    # single_result_link_element.when_visible
    # select_element_by_keyword(keyword, search_result_links)

    # search_result_links.each do |link_element|
    #   # p link_element.element
    # end
    PageObject::Accessors::link(:link_with_keyword, text: keyword )
    link_with_keyword
  end
  
  private

  def select_element_by_index(index, elements)
    elements[index].click
  end

  def select_element_by_keyword(keyword, elements)   
    elements.each do |element|
      if element.text.upcase.include? keyword.upcase
        element.click 
      end
    end
  end

end