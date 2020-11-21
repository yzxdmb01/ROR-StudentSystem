class BaseController < ApplicationController
  before_action :verify_login

  def verify_login
    if !current_user
      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end
end
