class UsersController < ApplicationController
  def new
    @user=User.new
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      flash[:notice] = "You Signed up successfully"
      flash[:color]= "valid"
      redirect to @user
      
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
      render'new'
end

def show
  @user=User.find(params[:id])
end

private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end



