class CoursesController < ApplicationController
  def new
    @courses=Course.all
    @course=Course.new
  end
  
  def create
    @courses=Course.all
    @course = Course.new(course_params)
    @course.professor_id = params[:professor][:professor_id]
    if @course.save
      flash[:notice] = "Course created successfully"
      flash[:color]= "valid"
      redirect_to(:back)
      #redirect_to 'taapp/successpage'
    else 
      flash[:notice] = "ERROR Course Failed to Create"
      redirect_to(:back)
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
    redirect_to(:back)
  else 
    flash[:notice] = "Error with deleting course"
    redirect_to(:back)
  end
  end

private

    def course_params
      params.require(:course).permit(:course_name, :open_spots)
    end
end
