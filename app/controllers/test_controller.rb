class TestController < BaseController
  def test
    flash.now[:user_id] = session[:user_id]
  end
end
