class TaappController < ApplicationController
  
  def index
    if session[:accounttype].present?
      if session[:accounttype] == "student"
        redirect_to action: 'form'
      elsif session[:accounttype] == "professor"
        redirect_to action: 'professor'
      elsif session[:accounttype] == "admin"
        redirect_to action: 'admin'
      end
    end
  end

  def form
  	@application = Application.new
    @course = Course.new

    if session[:accounttype].present? && session[:accounttype] == "student"
      render "form"
    else
      render "formerror"
    end
  end

  def create
    @application = Application.new(application_params)
    @course = Course.new()

    if @application.position_applying_for == "(select one)"
      @application.position_applying_for = nil
    end

    if @application.speak_score == "  "
      @application.speak_score = "N/A"
    end
    #tidying up the data so that it can insert into the DB correctly 
    if @application.save 
      redirect_to "/"
    else 
      render 'form'
      #flash[:notice] = @application.errors.full_messages
    end 
  end
  
  def professor
    if session[:accounttype].present? && session[:accounttype] == "professor"
      render "professor"
    else
      render "proferror"
    end
  end
  
  def admin
    if session[:accounttype].present? && session[:accounttype] == "admin"
      render "admin"
    else
      render "adminerror"
    end
  end

  private

    def application_params
      params.require(:application).permit(:postition_applying_for, :first_name, :last_name, :student_id, :gpa, :undergrad_status, 
        :grad_status, :advisor, :phone_num, :mizzou_email, :anticipated_graduation_date, :other_work, :speak_score, :semester_of_test, 
        :international1, :international2, :international3)
    end
    def course_params
      params.require(:course).permit(:co_id)
    end
  
end
