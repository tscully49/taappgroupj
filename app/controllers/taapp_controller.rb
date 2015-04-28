class TaappController < ApplicationController
  
  before_action :logged_in_prof, only: [:professor, :rate_applicant]
  before_action :logged_in_student, only: [:form, :status]
  
  def index
    if session[:accounttype].present?
      if session[:accounttype] == "student"
        redirect_to action: 'form'
      elsif session[:accounttype] == "professor"
        redirect_to action: 'professor'
      elsif session[:accounttype] == "admin"
        redirect_to "/admin/home"
      end
    end
  end

  def form
  	@application = Application.new
    @appcourse = ApplicationCourse.new
    @appcourse2 = ApplicationCourse.new
    @appcourse3 = ApplicationCourse.new
    @courses = Course.all.order(course_name: :asc)
    #@selected = (params[:app_courses].present?(app_courses) ? params[:app_courses] : [])
    
    user = User.find_by(id: session[:id])
    closed = CloseApplication.first
    if Application.find_by(mizzou_email: user.email) != nil
      redirect_to "/taapp/status"
    elsif closed.closed
      redirect_to "/taapp/application_closed"
    end
  end

  def status
    user = User.find_by(id: session[:id])
    if Application.find_by(mizzou_email: user.email) == nil
      redirect_to "/taapp/form" and return
    end
    @user=User.find_by(id: session[:id])
    @application=Application.find_by(student_id: @user.student_id)
    @applied = ApplicationCourse.where(:application_id => @application.id, :taught_teach_take_want => "want").order(course_id: :asc)
    @finalized = Finalized.first
  end

  def show
    @user=User.find(params[:id])
  end
  
  def rate_applicant
    
  end


  def create
    @application = Application.new(application_params)
    @courses = Course.all
    @test = params[:app_courses]
    @test2 = params[:app_courses2]
    @test3 = params[:app_courses3]
    @test4 = params[:app_courses4]
    @selected = (params[:app_courses].present? ? params[:app_courses] : [])
  
    @application.first_name = session[:first_name]
    @application.last_name = session[:last_name]
    @application.student_id = session[:student_id]
    @application.mizzou_email = session[:email]
    
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
          @appcourse = ApplicationCourse.new(:course_id => course, :application_id => (Application.count), :taught_teach_take_want => "teaching")
          @appcourse.save
        end
      end
      if @test2 != nil
        params[:app_courses2].each do |i|
          course = i
          @appcourse2 = ApplicationCourse.new(:course_id => course, :application_id => (Application.count), :taught_teach_take_want => "taught")
          @appcourse2.save
        end
      end
      if @test3 != nil
        params[:app_courses3].each do |i|
          course = i
          @appcourse3 = ApplicationCourse.new(:course_id => course, :application_id => (Application.count), :taught_teach_take_want => "taken")
          @appcourse3.save
        end
      end
      if @test4 != nil
        params[:app_courses4].each do |i|
          course = i
          @appcourse4 = ApplicationCourse.new(:course_id => course, :application_id => (Application.count), :taught_teach_take_want => "want")
          @appcourse4.save
        end
      end
        redirect_to '/taapp/status'
    else
        render 'form'
    end
  end

  def successpage

  end
  
  def professor
    if session[:accounttype].present? && session[:accounttype] == "professor"
      @professor = Professor.find_by(:id => session[:id])
      @courses = Course.where(professor_id: session[:id]).order(course_name: :asc)
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
    unless session[:accounttype].present? && ( session[:accounttype] == "professor" || session[:accounttype] == "admin")
      reset_session
      flash[:notice] = "This area only accessible by professors and administrators. Please log in as a professor or administrator to proceed."
      redirect_to '/'
    end
    @applications = Application.all
  end
  def test_applicant
    @test_apps=Application.joins(:application_courses).where("taught_teach_take_want = 'want' AND course_id = ?", params[course_select]).distinct
  end
  
  def application_closed
  end
  
  private

    def application_params
      params.require(:application).permit(:position_applying_for, :first_name, :last_name, :student_id, :gpa, :undergrad_status, 
        :grad_status, :advisor, :phone_num, :mizzou_email, :anticipated_graduation_date, :other_work, :speak_score, :semester_of_test, 
        :language_assessment, :GATO_requirement, :orientation_met)
    end
    
    def logged_in_prof
      unless session[:accounttype].present? && session[:accounttype] == "professor"
        reset_session
        flash[:notice] = "This area is only accessible by professors. Please log in as a professor to proceed."
        redirect_to '/'
      end
    end
    
    def logged_in_student
      unless session[:accounttype].present? && session[:accounttype] == "student"
        reset_session
        flash[:notice] = "This area is only accessible by student applicants. Please log in as a student to proceed."
        redirect_to '/'
      end
    end
end
