# encoding: utf-8
require 'page-object'

class ChildPage
  include PageObject

  page_url "file:///#{Dir.pwd}/modal_app/child.htm"
  button(:open_modal_popup, id: "OpenPopupButton")
  button(:close, id: "MyModalPopup")

  #
  # Based on the modal_dialog from page-object gem.
  # Override window.showModalDialog with window.open to
  # handle a modal window.
  #
  # @example
  #   @page.new_modal_dialog('_blank') do
  #     @page.action_that_spawns_the_modal
  #   end
  #
  # @param [String] name of window in which to load the URL. '_blank' will force a new window
  # @param block a block that contains the call that will cause the modal dialog
  def new_modal_dialog(name = 'modal', &block)
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