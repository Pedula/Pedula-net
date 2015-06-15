class HomeController < ApplicationController
	def index
		@rooms = Room.where(status: true).last(3)
	end
end
