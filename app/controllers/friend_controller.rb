class FriendController < ApplicationController
  def index
    require_login

    @friends = current_user.recomend_friend_list
  end

  def add
    require_login
    
    email = CGI.unescape params[:email]
    friend = User.find_by_email(email)
    user = current_user

    if friend.presence
      user.friends << friend

      flash[:success] = "#{friend.name} added successfully!"
    else
      flash[:error] = "#{email} not found!"
    end

    redirect_to friend_index_path
  end
end
