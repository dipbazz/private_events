module ApplicationHelper
  def user_signed_in?
    session[:current_user_id] ? true : nil
  end

  def current_user
    User.find(session[:current_user_id])
  end
end
