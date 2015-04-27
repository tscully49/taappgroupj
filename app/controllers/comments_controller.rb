class CommentsController < ApplicationController
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
  @comments=Comments.find(params[:id])
end

  def edit
    @admins = Professor.find(params[:id])
   # @all_profs = Professor.all
    render "edit"
     #if @admins.update_attributes(user_params)
        #@admins.save
        #flash[:notice] = "Professor account is edited successfully"
        #flash[:color]= "valid"
        #redirect_to(:back)
    #else
        #flash[:notice] = "Edit failed"
       # redirect_to(:back)
    #end
  end

  def update
      @admins= Professor.find(params[:id])
      if @admins.update_attributes(user_params)
        flash[:notice] = "Professor account is updated successfully"
        redirect_to @admins
      else
        flash[:notice] = "Edit failed"
        render '/admin/edit'
      end
  end

    
    
    
    
    
end
