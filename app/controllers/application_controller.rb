class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? #to make it available to views also not just controllers.
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end

    def logged_in?
      !!current_user
    end
      
end
