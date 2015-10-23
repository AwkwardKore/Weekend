class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user: params[:session][:user])
    if user && user.authenticate(params[:session][:pwd])

    else
      flash[:danger] = 'Invalid user/password'
      render 'new'
    end
  end

  def destroy
  end

end
