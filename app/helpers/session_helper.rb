helpers do

  def logged_in?
    session[:user_id] ? true : false
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

end
