class RatingController < ApplicationController
  def new
  @comments = Comments.new
    
  end
  
  def create
    @comments = Comments.new(user_params)
    if @comment.save
      flash[:notice] = "You Comment successfully"
      flash[:color]= "valid"
      redirect_to '/'
      
    else
      render 'rating/rating'
    end
  end

def show
  @commenst=Comments.find(params[:id])
end

  def edit
    @admins = Professor.find(params[:id])
    if @admins.save
        
      flash[:notice] = "Professor account is edited successfully"
      flash[:color]= "valid"
      redirect_to '/admin/successpage'
      redirect_to(:back)
    else
      render '/admin/edit'
      redirect_to(:back)
    end
  end

  def update
      @admins= Professor.find(params[:id])
      if @admins.update_attributes(user_params)
        redirect_to '/taapp/successpage'
      else
        render '/admin/edit'
      end
  end







end