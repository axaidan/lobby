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

	end

	private

	def find_ngo
		@ngo = Ngo.find(params[:id])
	end

end
