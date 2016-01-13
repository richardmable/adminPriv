class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    if user_params[:email] == "" || user_params[:password] == "" || user_params[:password_confirmation] == ""
      flash[:alert] = "All fields are required"
      render "new"
    else
      @user.create(user_params)
      if @user.save
        flash[:notice] = "Your account has been created"
        session[:user_id] = @user.id
        current_user
        redirect_to users
      else
        flash[:alert] = "There was a problem creating your account"
        render "new"
      end
    end
  end

  def show
  end

  def view
  end

  

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
