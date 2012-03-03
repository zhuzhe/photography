class Admin::SessionsController < ApplicationController

	layout 'admin'

	def new
		
	end

	def create
		if params[:username] != 'yuesheying' && params[:password] != 'admin@yuesheying'
			redirect_to login_path
		else
			session[:user_id] = params[:username]
			redirect_to admin_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end
end
