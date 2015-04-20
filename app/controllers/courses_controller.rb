class CoursesController < ApplicationController
  def new
    
    @course=Course.new
  end
  
  def create
    @course = Course.new(course_params)
    @course.prof_id = params[:professor][:prof_id]
    if @course.save
      redirect_to '/taapp/successpage'
      flash[:notice] = "Course created successfully"
      flash[:color]= "valid"
      #redirect_to 'taapp/successpage'
    else 
      render 'courses/new'
    end
  end
  
  def show
    @course=Course.find(params[:id])
  end

private

    def course_params
      params.require(:course).permit(:course_name, :open_spots)
    end
end

