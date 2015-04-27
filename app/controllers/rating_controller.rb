class RatingController < ApplicationController
  def new
  @comment = Comments.new
    
  end
  
  def create
    @comment = Comments.new(user_params)
    if @comment.save
      flash[:notice] = "You Comment successfully"
      flash[:color]= "valid"
      redirect_to '/'
      
    else
      render 'rating/rating'
    end
  end

def show
  @comment=Comments.find(params[:id])
end

end
