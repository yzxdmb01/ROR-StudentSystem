class TestController < BaseController
  def test
    flash.now[:user_id] = session[:user_id]
  end

  def get
    # @users = User.paginate(page:params[:page],per_page:params[:rows])
    @users = User.order('created_at desc').paginate :page => params[:page], :per_page => params[:rows]
    total = User.count

    render json:{total:total,rows:@users}
  end

  def index

  end
end
