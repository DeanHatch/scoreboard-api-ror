class ValidDate < ApplicationRecord
	
	belongs_to :competition, foreign_key: "competition_id"
	belongs_to :manager, foreign_key: "competition_id"
	validates_presence_of :competition_id

end
