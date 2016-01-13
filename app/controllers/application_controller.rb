class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if session[:user_id]
  		@currentUser = User.find(session[:user_id])
  	end
  end

  def no_current_user
  	if not session[:user_id]
  		flash[:alert] = "You need to be logged in to do that!"
  	end
  end
  
end
