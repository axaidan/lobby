class NgoTheme < ApplicationRecord

	belongs_to :ngo
	belongs_to :theme

	validates_uniqueness_of :theme, :scope => :ngo, :message => "Vous avez déjà indiqué que vous travaillez sur ce Thème."

end
