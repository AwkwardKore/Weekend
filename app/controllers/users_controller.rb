class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
     redirect_to(:home, alert: "El usuario se ha agregado correctamente")
    else
      if @user.password.eql?(@user.password_confirmation)
        redirect_to({action: "new"}, alert: "Favor de ingresar un correo electrónico válido")
      else
        redirect_to({action: "new"}, alert: "Las contraseñas no coinciden")
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
    redirect_to @user
    else
    render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def places
    @places = User.find(params[:id]).places
  end

  private
  def user_params
    params.require(:user).permit(:name, :user, :password, :password_confirmation, :mail)
  end
end
