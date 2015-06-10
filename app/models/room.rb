class Room < ActiveRecord::Base
	has_many :vinculos, foreign_key: :id
	has_many :users, through: :vinculos

	def complete_name
		"#{title}, #{location}"
	end
end

