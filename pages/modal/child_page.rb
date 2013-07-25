require 'page-object'

class ChildPage
  include PageObject

  page_url "file:///#{Dir.pwd}/modal_app/child.htm"
  button(:open_modal_popup, id: "OpenPopupButton")
  button(:close, id: "MyModalPopup")

  def new_modal_dialog(name, &block)
    script =
      %Q{
        window.showModalDialog = function(sURL, vArguments, sFeatures) {
          window.dialogArguments = vArguments;
          modalWin = window.open(sURL, '#{name}' , sFeatures);
          return modalWin;
        }
      }
    self.browser.execute_script script
    yield if block_given?
  end
end