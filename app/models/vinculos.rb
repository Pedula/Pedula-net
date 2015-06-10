class Vinculos < ActiveRecord::Base
	belongs_to :user, foreign_key: :id 
	belongs_to :room, foreign_key: :id 
end
