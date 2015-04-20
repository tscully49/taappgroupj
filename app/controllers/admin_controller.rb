class AdminController < ApplicationController
  
  
  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admins = Admin.new
  end
  
  def create
    @admins = Admin.new
  end

end
