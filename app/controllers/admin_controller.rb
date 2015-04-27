class AdminController < ApplicationController
  
  before_action :logged_in_admin
  
  def new
    @admins = Professor.new
    @profs = Professor.all
  end
  
  def home

    @final = Finalized.first
    @closed = CloseApplication.first

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

  def success
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
      @test = params[:select_tas]

      if @test != nil
        @open_spots_in_class = Course.find(params[:course_id])
        if @open_spots_in_class != 0
          params[:select_tas].each do |ta|
            @name = Application.select(:first_name, :last_name).where(:id => ta)
            @selection = Application.find_by(:id => ta)
            if @selection.update(:course_id => params[:course_id])
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
      @courses = Course.all.order(course_name: :asc)
    end 

    def finalize
      @final = Finalized.first
      if @final.finalized == false 
        @final.update(:finalized => true)
      else 
        @final.update(:finalized => false)
      end
      redirect_to "/admin/home"
    end
    
    def close
      @closed = CloseApplication.first
      if @closed.closed
        @closed.update(:closed => false)
      else
        @closed.update(:closed => true)
      end
      redirect_to "/admin/home"
    end

    private
  
      def admin_params
        params.require(:admin).permit(:admin_name, :password, :miz_email)
      end
      
      def professor_params
        params.require(:professor).permit(:prof_name, :password, :miz_email)
      end
      
      def logged_in_admin
        unless session[:accounttype].present? && session[:accounttype] == "admin"
          reset_session
          flash[:notice] = "This area is only accessible by administrators. Please log in as an administrator to proceed."
          redirect_to '/'
        end
      end
end