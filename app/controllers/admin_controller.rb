class AdminController < ApplicationController
  
  #before_action :logged_in_admin, only: [:edit, :update]
  
  def new
    @admins = Professor.new
    @profs = Professor.all
  end
  
  def home
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

  def success
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

    def error
    end

    def select
      @test = params[:select_tas]

      if @test != nil
        @open_spots_in_class = Course.find(params[:course_id])
        if @open_spots_in_class != 0
          params[:select_tas].each do |ta|
            @name = Application.select(:first_name, :last_name).where(:id => ta)
            @selection = SelectTa.new(:student_id => ta, :course_id => params[:course_id])
            if @selection.save
              @remove_app = Application.find_by(:id => ta, accepted: false)
              @remove_app.update(accepted: true)
              @remove_column = ApplicationCourse.where(:application_id => ta, :taught_teach_take_want => 'want')
              @remove_column.each do |remove|
                remove.destroy
                @open_spots_in_class.decrement!(:open_spots)
                if @open_spots_in_class == 0
                  redirect_to :back
                end
              end
              flash[:notice] = "TA's Added Successfully"
            else 
              flash[:notice] = "TA... FIX THIS " + @name.first.first_name + "  "+@name.first.last_name+" could NOT be added"
              #flash[:notice] = params
            end
          end
          redirect_to :back
        else
          flash[:notice] = "There are no more available spots in this class"
          redirect_to :back
        end
      else 
        flash[:notice] = "No Ta's were selected"
        redirect_to :back
      end


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
        params.require(:professor).permit(:prof_name, :password, :miz_email, :password_confirmation)
      end
      
      #def logged_in_admin
      #unless logged_in?
        #flash[:danger] = "Please log in."
        #redirect_to login_url
      #end
      #end
  end