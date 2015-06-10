class VinculosController < ApplicationController
	
	def index
		@vinculos = Vinculos.all
	end
	
	def new
		@vinculo = Vinculos.new
	end
	
	def create
		if @vinculos.status == false
			@vinculo =  User.new(user_params)
	end

end