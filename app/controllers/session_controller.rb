class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
    if user
      session[:user_id] = user.id
      # render plain: sprintf("welcome,%s!", user.name)
      redirect_to main_url
    else
      flash.now[:login_error] = "用户名或密码错误"
      render root_url
    end
  end

  private
  def user_params
    params.require(:session).permit(:name, :password)
  end
end
