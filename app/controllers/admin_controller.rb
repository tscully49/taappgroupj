class AdminController < ApplicationController
  
  before_action :logged_in_admin, only: [:edit, :update]
  
  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admins = Admin.new
    render '/admin/new'
  end
  
  def create
    @admins = Admin.new(addmin_params)
    if @admins.save
      log_in @admins
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render '/admin/new'
    end
  end


  def edit
    @admins = Admin.find(params[:id])
  end

  def update
      @admins= Admin.find(params[:id])
      if @admins.update_attributes(user_params)
        # Handle a successful update.
      else
        render '/admin/edit'
      end
    end
  

  private
  
      def admin_params
        params.require(:admins).permit(:admin_name, :password, :miz_email)
      end
      
       def professor_params
        params.require(:professors).permit(:prof_name, :password_digest, :miz_email)
      end
      
      def logged_in_admin
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  end