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
			@admin = current_user
			NgoMailer.refused_registration(@ngo, @admin).deliver_now
			redirect_to admin_ngos_path
		end

		def change_status
			@admin = current_user
			if !(@ngo.status)
				@ngo.status = true 
				NgoMailer.valid_status_email(@ngo, @admin).deliver_now
			else
				@ngo.status = false
				NgoMailer.non_valid_status_email(@ngo, @admin).deliver_now
			end
			@ngo.save
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
