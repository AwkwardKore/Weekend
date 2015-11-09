class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user: params[:session][:user])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to :controller => 'welcome', :action => 'start'
    else
      flash.now[:danger] = 'Combinación de correo/contraseña inválida'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
