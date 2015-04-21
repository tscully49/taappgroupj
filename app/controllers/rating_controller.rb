class RatingController < ApplicationController
  def new
  @comment = Comments.new
    
  end
  
  def create
    @comment = Comments.new(user_params)
    if @comment.save
      flash[:notice] = "You Signed up successfully"
      flash[:color]= "valid"
      redirect_to '/'
      
    else
      render '/taapp/test_app'
    end
  end

def show
  @comment=Comments.find(params[:id])
end
    
    
    
end
