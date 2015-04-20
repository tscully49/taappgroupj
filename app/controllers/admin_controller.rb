class AdminController < ApplicationController
  
  
  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admins = Admin.new
    render '/admin/new'
  end
  
  def create
    @admins = Professors.new(addmin_params)
    if @admins.save
      log_in @admins
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render '/admin/new'
    end
  end


  def edit
    @admins = Professors.find(params[:id])
  end


private

    def admin_params
      params.require(:user).permit(:admin_name, :password, :miz_email)
    end
end