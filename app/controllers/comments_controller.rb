class CommentsController < ApplicationController
def new

  @comment = Comment.new
  @student_id = params[:id]


    
end
  
  def create

      @comment = Comment.new(comments_param)
      @comment.prof_id = session[:id]
      @comment.date_commented = Date.today.to_s
      @comment.time_stamp = DateTime.now
      @comment.stu_id = params[:stu_id]
      
    if @comment.save
      @rating=Rating.new(:stu_id => @comment.stu_id, :prof_id => @comment.prof_id, :rating => @comment.rating)
      if @rating.save 
        flash[:notice] = "Comment and Rating successfully saved"
        redirect_to '/taapp/show_applicants'
      else 
        flash.now[:notice] = "Could not save rating"
        render 'new'
      end
    else
      flash.now[:notice] = "Could not add comment"
      render 'new'
    end
  end

def show
  @comment=Comment.find(params[:id])
end

def view_comments
  @comments=Comment.where(:stu_id => params[:id])
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

  private 
  
  def comments_param
      params.require(:comment).permit(:comment, :rating, :stu_id)
  end
end
