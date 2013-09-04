# encoding: utf-8
require 'page-object'

class DragAndDropPage
  include PageObject

  page_url "http://www.elated.com/res/File/articles/development/javascript/jquery/drag-and-drop-with-jquery-your-essential-guide/draggable.html"  # ncr forces to go to google.com without redirect

  
  div(:drag_and_drop, id: "makeMeDraggable")
  

  def drag_and_drop_div_by(right, down)
    # p "before"
    # in_frame(index: 0) do |frame|
      # p "in_frame"
      drag_and_drop_element.when_visible do
        self.browser.action.drag_and_drop_by(drag_and_drop_element.element, right, down).perform
        p " zzz here"
      # end
      end
  end
end
  
  