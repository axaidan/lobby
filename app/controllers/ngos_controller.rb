class NgosController < ApplicationController
	before_action :find_ngo, only: [:show, :edit, :update]

	def index
		@ngos = Ngo.all
	end

	def show

	end

	def edit

	end

	def update	
		if @ngo.update(ngo_params)
			flash[:success] = "Vous avez modifié vos informations avec succès."
			redirect_to ngo_path(current_ngo)
		else
			flash[:error] = @ngo.errors.full_messages.to_sentence
			redirect_to edit_ngo_path(current_ngo)
		end
	end

	private

	def find_ngo
		@ngo = Ngo.find(params[:id])
	end

	def ngo_params
		params.require(:ngo).permit(:email, :name, :url, :description)
	end

end
