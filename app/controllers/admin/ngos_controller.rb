module Admin
	class NgosController < ApplicationController
		before_action :is_user_admin?

		def index
			@ngos = Ngo.all
		end

		def edit

		end

		def update

		end
		
		private

		def is_user_admin?
			unless current_user.role == 'admin' && user_signed_in?
				flash[:warning] = "Vous n'êtes pas administrateur."
				redirect_to root_path
			end
		end

	end
end
