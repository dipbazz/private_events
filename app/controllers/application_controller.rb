class ApplicationController < ActionController::Base
  def authenticate_user!
    if user_signed_in?
      return true
    else
      redirect_to new_user_path
    end
  end

  def user_signed_in?
    session[:current_user_id] ? true : nil
  end

  def current_user
    User.find(session[:current_user_id])
  end
end
