class AdminsController < ApplicationController
  def index
    @admins= Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
     redirect_to @admin
    else
     render 'new'
    end
  end

  def edit
    @admin = admin.find(params[:id])
  end

  def update
    @admin = admin.find(params[:id])

    if @admin.update(admin_params)
    redirect_to @admin
    else
    render 'edit'
    end
  end

  def destroy
    @admin = admin.find(params[:id])
    @admin.destroy

    redirect_to admins_path
  end

  private
  def admin_params
    params.require(:admin).permit(:user, :mail, :password)
  end
end
