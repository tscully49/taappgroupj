class AdminController < ApplicationController
  
  #before_action :logged_in_admin, only: [:edit, :update]
  
  def new
    @admins = Professor.new
    @profs = Professor.all
  end
  
  def home
    render "home"
  end

  def create
    @admins = Professor.new(professor_params)
    if @admins.save
      flash[:notice] = "Professor account is created successfully"
      redirect_to(:back)
    else
      flash[:notice] = 'Error with adding professor account'
      redirect_to(:back)
    end
  end


  def edit
    @admins = Professor.find(params[:id])
    #if @admins.update_attributes(name: params[:prof_name], miz_email: params[:miz_email], password: params[:password]) 
    if @admins.update_attributes(professor_params)
        flash[:notice] = "Professor account is edited successfully"
        redirect_to(:back)
    else
        flash[:notice] = "Edit failed"
        redirect_to(:back)
    end
  end

  def update
    @admins = Professor.find(params[:id])
    @all_profs = Professor.all
    render "update"
  end
  

    def index
      @admins = Professor.all
    end
    
    def show
        @admin = Professor.find(params[:id])
    end

    def error
    end

    def select
      @selection = Application.new()
    end

    def destroy
      @profs=Professor.all
      @prof= Professor.find(params[:id])
      if @prof.destroy
        flash[:notice] = "Course has been deleted"
        redirect_to(:back)
      else 
        flash[:notice] = "Error with deleting course"
        redirect_to(:back)
      end
    end

    def assign
      @courses = Course.all
    end 

    private
  
      def admin_params
        params.require(:admin).permit(:admin_name, :password, :miz_email)
      end
      
      def professor_params
        params.require(:professor).permit(:prof_name, :password, :miz_email)
      end
      
      #def logged_in_admin
      #unless logged_in?
        #flash[:danger] = "Please log in."
        #redirect_to login_url
      #end
      #end
  end