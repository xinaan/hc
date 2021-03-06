class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def confirm_logged_in
    if session[:user_id]

      false # halts the before_filter
    else
      flash[:notice] = "Please log in to Access this page"
      redirect_to(:controller => 'access', :action => 'login')
      false
    end
  end
  
end
