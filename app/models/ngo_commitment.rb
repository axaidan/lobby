class NgoCommitment < ApplicationRecord
	belongs_to :ngo
	belongs_to :commitment

	validates_uniqueness_of :commitment, :scope => :ngo, :message => "Vous soutenez déjà ce Mouvement."
	
end
