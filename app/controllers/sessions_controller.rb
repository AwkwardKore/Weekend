class SessionsController < ApplicationController
  def new
  end


    def create
      user = User.find_by(user: params[:session][:user])
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to :controller => 'places', :action => 'index'
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end

  def destroy
    log_out
    redirect_to root_url
  end

end
