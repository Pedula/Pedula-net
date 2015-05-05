class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
# def create
#   @user = User.new(user_params)
#   @user.save!
#   redirect_to @user,
#   :notice => 'Cadastro criado com sucesso!'
#  end
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

   def user_params
    params.require(:user).permit(:full_name, :email, :bio, :password_digest, :location)
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
    redirect_to @user, :notice => 'Usuario exucluido com sucesso!'
  end
end
