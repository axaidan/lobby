module AccessibleDevise

	extend ActiveSupport::Concern

	included do
		before_action :check_user
	end

	protected 

	def check_user
		if current_ngo 
			flash[:error] = "Une NGO ne peut pas accéder à cette page."
			redirect_to root_path and return 
		elsif current_user
			flash[:error] = "Vous avez besoin d'autorisations spécifiques pour accéder à cette page." 
			redirect_to root_path and return
		end
	end

end	
