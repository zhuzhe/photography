class Admin::MessagesController < ApplicationController
    layout 'admin'
	def index
		@admin_messages = Admin::Message.all(:order => 'created_at DESC')
	end          
	
	def show
	   @admin_message = Admin::Message.find(params[:id])
	end

	def destroy
		@admin_message = Admin::Message.find(params[:id])
		@admin_message.destroy
		redirect_to admin_messages_path
	end
end
