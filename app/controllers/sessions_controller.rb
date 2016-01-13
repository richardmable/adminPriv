class SessionsController < ApplicationController
  def create
  	user = user.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		current_user
  		redirect_to root_path :notice => "Welcome back, #{user.email}"
  	else
  		flash[:alert] = "Your username or password did not match."
  		render "new"
  	end
  end

  def destroy
  	current_user
  	session[:user_id] = nil
  	redirect_to root_path
  end
  
end
