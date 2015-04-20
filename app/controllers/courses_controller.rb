class CoursesController < ApplicationController
  def new
    
    @course=Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course created successfully"
      flash[:color]= "valid"
    end
end

def show
  @course=Course.find(params[:id])
end

private

    def course_params
      params.require(:course).permit(:course_name)
    end
end
