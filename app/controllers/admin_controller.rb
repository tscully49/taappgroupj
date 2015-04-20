class AdminController < ApplicationController
  
  
  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admins = Admin.new
    render '/admin/new'
  end
  
  def create
    @admins = Admin.new(addmin_params)
  end


private

    def admin_params
      params.require(:user).permit(:admin_name, :password, :miz_email)
    end
end