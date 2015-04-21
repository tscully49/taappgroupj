class AdminController < ApplicationController
  
  #before_action :logged_in_admin, only: [:edit, :update]
  
  def new
    @admins = Professor.new
  
  end
  
  def home
  end

  def create
    @admins = Professor.new(professor_params)
    if @admins.save
      redirect_to '/admin/successpage'
      flash[:notice] = "Professor account is created successfully"
      flash[:color]= "valid"
    else
      render '/admin/new'
    end
  end


  def edit
    @admins = Professor.find(params[:id])
    if @admins.save
        
      flash[:notice] = "Professor account is edited successfully"
      flash[:color]= "valid"
      redirect_to '/admin/successpage'
    else
      render '/admin/edit'
    end
  end

  def update
      @admins= Professor.find(params[:id])
      if @admins.update_attributes(user_params)
        redirect_to '/taapp/successpage'
      else
        render '/admin/edit'
      end
  end
  

    def index
      @admins = Professor.all
    end
    
    def show
    @admin = Professor.find(params[:id])
    end
    
    private
  
      def admin_params
        params.require(:admins).permit(:admin_name, :password, :miz_email)
      end
      
      def professor_params
        params.require(:professors).permit(:prof_name, :password_digest, :miz_email)
      end
      
      #def logged_in_admin
      #unless logged_in?
        #flash[:danger] = "Please log in."
        #redirect_to login_url
      #end
      #end
  end