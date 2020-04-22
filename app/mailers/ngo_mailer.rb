class NgoMailer < ApplicationMailer
	default from: 'admilobbynistrator@gmail.com'

	def welcome_email(ngo)
		@ngo = ngo
		@url = 'https://le-lobby.herokuapp.com'
		mail(to: ngo.email, subject: "Le Lobby - votre inscription en tant qu'ONG")
	end

	def valid_status_email(ngo, admin)
		@ngo = ngo
		@admin = admin
		mail(to: @ngo.email, subject: "Le Lobby - votre inscription est validée")
	end

	def non_valid_status_email(ngo, admin)
		@ngo = ngo
		@admin = admin
		mail(to: @ngo.email, subject: "Le Lobby - votre inscription est invalidée")
	end

	def refused_registration(ngo, admin)
		@ngo = ngo
		@admin = admin
		mail(to: @ngo.email, subject: "Le Lobby - incription refusée")
	end
	
end
