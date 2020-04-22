class AdminMailer < ApplicationMailer

	def new_ngo_mail(ngo)
		@ngo = ngo
		admins_array = find_admins
		admins_array.each do |each_admin|
			mail(to: each_admin.email, subject: "Une nouvelle ONG (#{@ngo.email}) est en attente de validation.")
		end
	end

	private 

	def find_admins
		@admins = User.all.where(role: 'admin')
	end

end
