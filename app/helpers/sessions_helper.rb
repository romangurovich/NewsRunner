require 'SecureRandom'
module SessionsHelper

	def log_in(name, password)
		user = User.find_by_name(name)
		if user && user.password == password
			user.remember_token = generate_token
			user.save!
			true
		else
			false
		end
	end

	def current_user
		@current_user ||= User.find_by_remember_token(session[:remember_token])
	end

	def log_out
		@current_user = nil
		session[:remember_token] = nil
	end

	def logged_in?
		not current_user.nil?
	end

	private

	def generate_token
		SecureRandom.hex(16)
	end
end
