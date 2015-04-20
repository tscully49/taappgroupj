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
    @appcourse = ApplicationCourse.new
    @appcourse2 = ApplicationCourse.new
    @appcourse3 = ApplicationCourse.new
    @courses = Course.all

    if session[:accounttype].present? && session[:accounttype] == "student"
      user = User.find_by(id: session[:id])
      if Application.find_by(mizzou_email: user.email)
        render "successpage"
      else
        render "form"
      end
    else
      render "formerror"
    end
  end

  def show
  @user=User.find(params[:id])
  end


  def create
    @application = Application.new(application_params)
    @courses = Course.all
    @test = params[:app_courses]

    if @application.position_applying_for == "(select one)"
      @application.position_applying_for = nil
    end

    if @application.speak_score == "  "
      @application.speak_score = "N/A"
    end

    if @application.semester_of_test == ""
      @application.semester_of_test = "N/A"
    end

    @application.accepted = false

    @application.date_of_app = Date.today.to_s

    if @application.language_assessment == "(select one)"
      @application.language_assessment = nil
    end

    if @application.GATO_requirement == "(select one)"
      @application.GATO_requirement = nil
    end

    if @application.orientation_met == "(select one)"
      @application.orientation_met = nil
    end

    if @application.save
      if @test != nil 
        params[:app_courses].each do |i|
          course = i
          @appcourse = ApplicationCourse.new(:course_id => course, :application_id => (Application.count), :taught_teach_take_want => "teaching now")
          @appcourse.save
        end
      end
      redirect_to '/taapp/successpage'
    else
      render 'form'
    end
  end

  def successpage

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
  
  def show_applicants
    @users = User.all
  end

  private

    def application_params
      params.require(:application).permit(:position_applying_for, :first_name, :last_name, :student_id, :gpa, :undergrad_status, 
        :grad_status, :advisor, :phone_num, :mizzou_email, :anticipated_graduation_date, :other_work, :speak_score, :semester_of_test, 
        :language_assessment, :GATO_requirement, :orientation_met)
    end
end
