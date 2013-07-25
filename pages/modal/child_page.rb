require 'page-object'

class ChildPage
  include PageObject

  page_url "file:///#{Dir.pwd}/modal_app/child.htm"
  button(:open_modal_popup, id: "OpenPopupButton")
  button(:close, id: "MyModalPopup")
end