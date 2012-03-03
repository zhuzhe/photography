class AdminController < ApplicationController
	before_filter :require_login

	def require_login
		unless current_user
			redirect_to login_path
		end
	end

	def  current_user
		if login?
			return session[:user_id]
		else
			redirect_to login_path
		end
	end

	def login?
		if session[:user_id]
			return true
		end
		return false
	end

end