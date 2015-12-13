class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :require_login, :extract_urls

  def current_user
    return nil if !session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def signed_in?
    current_user
  end

  def require_login
    if !signed_in?
      flash[:error] = 'Please login!'
      redirect_to login_path
    end
  end

  def extract_urls(image)
    urls = JSON.parse(File.basename(image.current_path))
    baseUrl = File.dirname(image.url)
    
    urls.map {|url| "#{baseUrl}/#{url}"}
  end

  def get_root_path
      "#{request.protocol}#{request.host_with_port}"
    end
end
