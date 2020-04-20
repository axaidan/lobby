class NgosController < ApplicationController
	before_action :find_ngo, only: [:show, :edit, :update]

	def index
		@ngos = Ngo.all
	end

	def show
	end

	def edit
		if !(@ngo.status) 
			flash[:error] = "<p>Votre profil est en attente de validation par un administrateur.</p>
<p>Pour plus de sécurité dans la présence des NGOs sur le site nos administrateurs ont pour mission de vérifier votre demande d'inscription.</p>
<p>Dans le cas où nous ne saurions faire confirmer votre demande d'inscription auprès de l'administration de votre structure nous nous réservons le droit de supprimer votre compte.</p>
<p>Merci de votre compréhension.</p>"
		end
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
