class Admin::MessagesController < ApplicationController
	def index
		@admin_messages = Admin::Messages.all(:order => 'created_at DESC')
	end
end
