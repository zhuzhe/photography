class Admin::MessagesController < ApplicationController
    layout 'admin'
	def index
		@admin_messages = Admin::Message.all(:order => 'created_at DESC')
	end          
	
	def show
	   @admin_message = Admin::Message.find(params[:id])
	end
end
