class Room < ActiveRecord::Base

	validates :title, :location, :presence => true
  	validates_length_of :description, :minimum => 3, :allow_blank => false

	has_many :vinculos, foreign_key: :id
	has_many :users, through: :vinculos

	def complete_name
		"#{title}, #{location}"
	end
end

