class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    @professor = Professor.find_by(miz_email: params[:session][:email].downcase)
    @admin = Admin.find_by(miz_email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:accounttype] = "student"
      session[:id] = @user.id
      session[:student_id] = @user.student_id
      session[:email] = @user.email
      session[:first_name] = @user.first_name
      session[:last_name] = @user.last_name
      redirect_to "/taapp/form"
    elsif @professor && @professor.authenticate(params[:session][:password])
      session[:accounttype] = "professor"
      session[:id] = @professor.id
      redirect_to "/taapp/professor"
    elsif @admin && @admin.authenticate(params[:session][:password])
      session[:accounttype] = "admin"
      session[:id] = @admin.id
      session[:first_name] = @admin.admin_name
      redirect_to "/admin/home"
    else
      flash.now[:notice] = 'Invalid email/password combination'
      render "/taapp/index"
    end
  end
  
  def destroy
    reset_session
    redirect_to ''
  end
end
