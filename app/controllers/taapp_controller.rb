class TaappController < ApplicationController
  
  def index
#    if session[:accounttype].present?
#      if session[:accounttype] == "student"
#        redirect_to action: 'form'
#      elsif session[:accounttype] == "professor"
#        redirect_to action: 'professor'
#      elsif session[:accounttype] == "admin"
#        redirect_to action: 'admin'
#      end
#    end
  end

  def form
  	@application = Application.new
#    if session[:accounttype].present? && session[:accounttype] == "student"
#      render "form"
#    else
#      render "formerror"
#    end
  end

  def register
    @users = User.new
  end
  
  def professor
#    if session[:accounttype].present? && session[:accounttype] == "professor"
#      render "professor"
#    else
#      render "proferror"
#    end
  end
  
  def admin
#    if session[:accounttype].present? && session[:accounttype] == "admin"
#      render "admin"
#    else
#      render "adminerror"
#    end
  end
  
end
