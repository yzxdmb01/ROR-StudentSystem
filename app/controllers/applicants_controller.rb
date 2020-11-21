class ApplicantsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if(@user.save)
      redirect_to root_url
    else
      render "new"
    end
  end

  def add
    @user = User.find_by(name:params[:name])
    if @user
      render json: {code:201,msg:"已存在"}
    else
      @user_save = User.new(name:params[:name],password:params[:password])
      if @user_save.save
        render json: {code:200,msg:"success"}
      else
        render json: {code:201,msg:"fail"}
      end
    end

  end

  def del
    @user = User.find(params[:id])
    @user.destroy
    render json: {code:200}
  end

  private
  def user_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end
