class StudentsController < BaseController
  skip_before_action :verify_authenticity_token

  def index
    @clazz = Clazz.find(params[:cid])
  end

  def create
    @student = Student.find_by(name: params[:name])
    if @clazz
      render json: {code: 201, msg: "已存在"}
    else
      @student = Student.new(name: params[:name], age: params[:age], clazz_id: params[:cid])
      if @student.save
        render json: {code: 200, msg: "success"}
      else
        render json: {code: 201, msg: "fail"}
      end
    end
  end

  def destroy
  @students = Student.find(params[:id])
    @students.destroy
    render json: {code:200}
  end

  def update
    @students = Student.find(params[:id])

    if @students.update(name:params[:name],age:params[:age])
      render json: {code: 200, msg: "success"}
    else
      render json: {code: 201, msg: "fail"}
    end
  end

  def list
    @students = Student.where(clazz_id: params[:cid]) do
      order('created_at desc').paginate :page => params[:page], :per_page => params[:rows]
    end
    total = Student.where(clazz_id: params[:cid]).count

    render json: {total: total, rows: @students}
  end
end
