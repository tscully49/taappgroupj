class UsersController < ApplicationController
  def new
    @user = User.new
    render '/taapp/register'
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You Signed up successfully"
      flash[:color]= "valid"
      redirect_to '/'
      
    else
      render '/taapp/register'
    end
end

def show_applicants
    @user=User.all
    render '/taapp/show_applicants'
end

def show
  @user=User.find(params[:id])
end

private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :student_id, :email, :password, :password_confirmation)
    end
end



