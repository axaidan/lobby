class Ngo < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	# CALLBACKS
	after_create :welcome_send
	after_create :assign_default_status

	# LINK TABLES
	# LINK THEMES
	has_many :ngo_themes, dependent: :destroy
	has_many :themes, through: :ngo_themes
	accepts_nested_attributes_for :themes
	# LINK COMMITMENTS
	has_many :ngo_commitments, dependent: :destroy
	has_many :commitments, through: :ngo_commitments

	# METHODS
	private

	def welcome_send
		NgoMailer.welcome_email(self).deliver_now
		AdminMailer.new_ngo_mail(self).deliver_now
	end

	def assign_default_status
		self.status = false
		self.save
	end

end
