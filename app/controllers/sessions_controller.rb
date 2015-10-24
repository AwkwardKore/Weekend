class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user: params[:session][:user])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid user/password'
      render 'new'
    end
  end

  def destroy
  end

end
