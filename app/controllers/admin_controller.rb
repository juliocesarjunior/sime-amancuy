class AdminController < ActionController::Base

	# DEVISE
	#before_action :authenticate_user!
	#before_action :admin_status_active
	
	layout 'admin'

	def admin_status_active
		if !current_user.nil? and current_user.status!="active"
			redirect_to destroy_user_session_path
		end
	end

end