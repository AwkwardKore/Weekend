class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid user/password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def user_params
      params.require(:session).permit(:name, :user, :password, :mail,
                                   :password_confirmation)
    end

end
