class Ngo < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	# CALLBACKS
	after_create :welcome_send
	after_create :assign_default_status

	# METHODS

	private

	def welcome_send
		NgoMailer.welcome_email(self).deliver_now
	end

	def assign_default_status
		self.status = false
		self.save
	end

end
