class NgoCommitmentsController < ApplicationController

	before_action :ngo_status_check, only: [:create]

	def create
		@ngo_commitment = NgoCommitment.new
		@ngo_commitment.ngo = current_ngo
		@ngo_commitment.commitment = Commitment.find(params[:commitment_id])
		@ngo_commitment.save
		flash[:success] = 'Votre ONG soutient désomais ce Mouvement.'
		redirect_to commitment_path(@ngo_commitment.commitment.id)
	end

	def destroy
		@ngo_commitment = NgoCommitment.find(params[:id])
		@ngo_commitment.destroy
		flash[:success] = 'Vous ne soutenez plus ce Mouvement.'
		redirect_to commitment_path(@ngo_commitment.commitment.id)
	end

	private 

	def ngo_status_check
		if !(ngo_signed_in?) || current_ngo.status == false
			flash[:error] = "Vous ne pouvez pas soutenir de Mouvement tant que votre incription n'a pas été validée."
			redirect_to commitments_path
		end
	end

end
