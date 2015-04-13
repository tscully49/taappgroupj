class TaappController < ApplicationController
  
  def index
    if (session[:accounttype].present?)
      if (session[:accounttype] == "student")
        render 'form'
      elsif (session[:accounttype] == "professor")
        redirect_to professor
      elsif (session[:accounttype] == "admin")
        redirect_to admin
      end
    end
  end

  def form
  end

  def register
  end
  
end
