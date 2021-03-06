class AccessController < ApplicationController
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout, :verify, :attempt_verify]
  layout 'login'

  def index

  end

  def verify
    user = User.find(session[:user_id])
    if user.nil?
      redirect_to login_path
    end
  end

  def login

  end

  def attempt_login
    if session[:user_id]
      redirect_to(:controller => 'faculties', :action => 'index')
    else
      authorized_user = User.authenticate(params[:username], params[:password])
      if authorized_user
        session[:user_id] = authorized_user.id
        session[:username] = authorized_user.username
        redirect_to faculties_path
      else
        flash[:notice]= "Invalid Username/Password Try Again"
        redirect_to(action: 'login')
      end
    end

  end

  def attempt_verify
    verified_user = User.verify(session[:user_id], params[:code])
    if verified_user
      verified_user.is_verified = true
      verified_user.save(:validate => false)
      session[:is_verified] = true
      redirect_to products_path
    else
      flash[:notice]= "Invalid Code Please Try Again"
      redirect_to(action: 'verify')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:is_verified] = nil
    redirect_to(action: 'login')
  end
end
