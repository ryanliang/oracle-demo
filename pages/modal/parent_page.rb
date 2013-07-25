require 'page-object'

class ParentPage
  include PageObject

  page_url "file:///#{Dir.pwd}/modal_app/parent.htm"
  button(:open_modal_popup, id: "OpenPopupButton")


end