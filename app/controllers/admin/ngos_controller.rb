module Admin
	class NgosController < ApplicationController
		before_action :is_user_admin?
		before_action :find_ngo, only: [:edit, :update, :destroy, :change_status]

		def index
			@ngos = Ngo.all.sort
		end

		def edit

		end

		def update

		end
		
		def destroy 
			@ngo.destroy
		end
		
		def change_status
			if !(@ngo.status)
				@ngo.status = true 
				@ngo.save
			else
				@ngo.status = false
				@ngo.save
			end
			redirect_to admin_ngos_path
		end
		
		private

		def find_ngo
			@ngo = Ngo.find(params[:id])
		end

		def is_user_admin?
			unless current_user.role == 'admin' && user_signed_in?
				flash[:warning] = "Vous n'êtes pas administrateur."
				redirect_to root_path
			end
		end

	end
end
