class UsersController < ApplicationController
  def new
    @user=User.new
  end
  
  def create
    @user=User.new(params[:user])
    if @user.save
      flash[:notice] = "You Signed up successfully"
      redirect to @user
      
    else
      render 'new'
    end
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



