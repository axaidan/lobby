class ThemesController < ApplicationController

	before_action :store_location

	def index
		@themes = Theme.all
	end

	def show
		@theme = Theme.find(params[:id])
	end

end
