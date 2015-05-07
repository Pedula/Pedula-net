class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def create
    params[:user][:password_digest] = BCrypt::Password.create('secret')
    @user = User.new(user_params)
    if @user.save
      SignupMailer.confirm_email(@user).deliver
      redirect_to @user,
       :notice => 'Cadastro criado com sucesso!'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user =  User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => 'Usuario atualizado com sucesso!'
    else
      render :update
    end
  end

  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
    sign_out
    redirect_to @user, :notice => 'Usuario exucluido com sucesso!'
  end
  
  private

  def user_params
      params.require(:user).permit(:full_name, :email, :bio, :password_digest, :location)
  end
end
