class MessagesController < ApplicationController
  def index     
      @message = Message.new
  end     
  
  def create
    Message.create(params[:message])
    redirect_to messages_path
  end

end
