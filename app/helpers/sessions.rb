helpers do

  def current_user
    # TODO: return the current user if there is a user signed in.
    if session[:user_id]
      return User.find(session[:user_id])
    else
      return nil
    end
  end

end