class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def authorize
  	unless logged_in?
  		redirect_to root_path
  	end
  end

  def correct_user?
  	@user = User.find(params[:id])
  		unless current_user == @user  			
  		end
  end

end
