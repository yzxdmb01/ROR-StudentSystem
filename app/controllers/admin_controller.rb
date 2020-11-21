class AdminController < BaseController
  def index
  end

  def list
    @users = User.order('created_at desc').paginate :page => params[:page], :per_page => params[:rows]
    total = User.count

    render json:{total:total,rows:@users}
  end
end
