class HomeController < ApplicationController
	def index
		@rooms = Room.last(3)
	end
end