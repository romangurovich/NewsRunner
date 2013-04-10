require 'SecureRandom'
module SessionsHelper

	def log_in(name, password)
		user = User.find_by_name(name)
		if user && user.password == password
			user.remember_token = generate_token
			user.save!
			return user
		else
			false
		end
	end

	def current_user
		return @curent_user = nil unless session[:remember_token]
		@current_user ||= User.find_by_remember_token(session[:remember_token])
	end

	def log_out
		session[:remember_token] = nil
		@current_user = nil
	end

	def logged_in?
		not current_user.nil?
	end

	def admin?
		current_user && current_user.name == "admin"
	end

	private

	def generate_token
		SecureRandom.hex(16)
	end
end
