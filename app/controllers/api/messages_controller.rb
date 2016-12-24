class Api::MessagesController < Api::BaseController
  def index
     @messages = Message.all
  end


end
