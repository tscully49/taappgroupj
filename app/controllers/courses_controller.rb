class CoursesController < ApplicationController
  def new
    @courses=Course.all
    @course=Course.new
  end
  
  def create
    @courses=Course.all
    @course = Course.new(course_params)
    @course.prof_id = params[:professor][:prof_id]
    if @course.save
      render 'courses/new'
      flash[:notice] = "Course created successfully"
      flash[:color]= "valid"
      #redirect_to 'taapp/successpage'
    else 
      render 'courses/new'
    end
  end
  
  def show
    @course= Course.find(params[:id])
  end

  def destroy
  @courses = Course.all
  @course= Course.find(params[:id])
  if @course.destroy
  flash[:notice] = "Course has been deleted"
  render 'courses/new'
  else 
      flash.now[:notice] = "Error with deleting course"
      render 'courses/new'
  end
  end

private

    def course_params
      params.require(:course).permit(:course_name, :open_spots)
    end
end
