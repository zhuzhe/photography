class Admin::SessionsController < ApplicationController

	layout 'admin'

	def new
		
	end

	def create
		@user = Admin::User.first(:conditions => {:name => params[:username], 
			:pwd => params[:pwd]})
		if @user
			session[:user_id] = @user.id
			redirect_to admin_path
		else
			redirect_to :action => :new
		end
		
	end

	def destroy
		
	end
end
