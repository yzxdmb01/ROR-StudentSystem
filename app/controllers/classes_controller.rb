class ClassesController < BaseController
  skip_before_action :verify_authenticity_token
  def index

  end

  def list
    @classes = Clazz.order('created_at desc').paginate :page => params[:page], :per_page => params[:rows]
    total = Clazz.count

    render json: {total: total, rows: @classes}
  end

  def create
    @clazz = Clazz.find_by(name: params[:name])
    if @clazz
      render json: {code: 201, msg: "已存在"}
    else
      @clazz = Clazz.new(name:params[:name],teacher:params[:teacher])
      if @clazz.save
        render json: {code: 200, msg: "success"}
      else
        render json: {code: 201, msg: "fail"}
      end
    end
  end

  def del
    @clazz = Clazz.find(params[:id])
    @clazz.destroy
    render json: {code:200}
  end

  def update
    @clazz = Clazz.find(params[:id])

    if @clazz.update(name:params[:name],teacher:params[:teacher])
      render json: {code: 200, msg: "success"}
    else
      render json: {code: 201, msg: "fail"}
    end
  end
end
