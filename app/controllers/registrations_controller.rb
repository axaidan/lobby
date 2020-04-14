class RegistrationsController < Devise::RegistrationsController

	include AccessibleDevise
	skip_before_action :check_user, except: [:new, :create]

	protected

	def after_sign_up_path_for(resource)
		edit_user_path(current_user.id)
	end
end
