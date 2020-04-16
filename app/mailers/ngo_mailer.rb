class NgoMailer < ApplicationMailer
	default from: 'admilobbynistrator@gmail.com'

	def welcome_email(ngo)
		@ngo = ngo
		@url = 'https://le-lobby.herokuapp.com'
		mail(to: ngo.email, subject: "Le Lobby - votre inscription en tant qu'ONG")
	end
end
