class SessionsController < ApplicationController
	def new
	end

	def create
		user = log_in(params["user"]["name"], params["user"]["password"])	
		if user
			session[:remember_token] = user.remember_token
			redirect_to user_path(user)
		else
			flash.now[:error] = "Incorrect user name or password"
			render :new
		end
	end

	def destroy
		log_out
		redirect_to root_url
	end

end
