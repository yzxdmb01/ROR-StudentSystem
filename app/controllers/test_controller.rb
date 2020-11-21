class TestController < BaseController
  def test
    flash.now[:user_id] = session[:user_id]
  end

  def get
    @users = User.all
    render :json  => @users.to_json
  end

  def index

  end
end
