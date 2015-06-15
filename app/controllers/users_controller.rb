class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
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
    set_user
  end

  def edit
    set_user
  end

  def update

    if @user.update_attributes(user_params)
      redirect_to @user, :notice => 'Usuario atualizado com sucesso!'
    else
      render :update
    end
  end

  def index
    @users = User.where(status: true)
  end

  def destroy
    set_user.update_attributes(status: false)
    redirect_to @user, :notice => 'Usuario exucluido com sucesso!'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params[:user][:password_digest] = BCrypt::Password.create(params[:user][:password_digest]).to_s
    params.require(:user).permit(:full_name, :email, :bio, :password_digest, :location)
  end
end
