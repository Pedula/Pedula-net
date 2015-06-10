class Room < ActiveRecord::Base
	has_many :vinculo, foreign_key: :id
	has_many :user, through: :vinculo

	def complete_name
		"#{title}, #{location}"
	end
end

