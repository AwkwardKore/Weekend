class SessionsAdminController < ApplicationController

  helper_method :log_in_admin

  def new
  end

   def create
     admin = Admin.find_by(user: params[:session][:user])
     if admin && admin.authenticate(params[:session][:password])
       # Log the user in and redirect to the user's show page.
       log_in_admin admin
       redirect_to admin
     else
       flash.now[:danger] = 'Invalid email/password combination'
       render 'new'
     end
   end

   def destroy
   end
end
