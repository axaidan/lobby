class Ngo < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	# CALLBACKS
	after_create :welcome_send

	# METHODS

	private

	def welcome_send
		NgoMailer.welcome_email(self).deliver_now
	end

end
