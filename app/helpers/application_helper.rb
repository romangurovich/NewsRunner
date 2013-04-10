module ApplicationHelper
	def log_in_toggle
		html = ""
		html << "<div class= 'log_in_toggle'>"

		if logged_in?
			html << (link_to current_user.name, user_path(current_user), class: "black")
			html << " | "
			html << (link_to 'Log out', session_path, method: :delete)
		else
			html << (link_to 'Sign up', new_user_path)
			html << " | "
			html << (link_to 'Log in', new_session_path)
		end

		html << "</div>"
		html.html_safe
	end
end
