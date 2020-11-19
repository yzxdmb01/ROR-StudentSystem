class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # @current_user = User.find_by(id:session[:user_id]) if session[:user_id]
    @current_user = "123"
    return @current_user
  end
end
