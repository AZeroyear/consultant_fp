class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :fp_user,     only: [:index, :fp_update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:alert] = "更新されました。"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def fp_update
    @user = User.find_by(email: params[:user][:email])
    if @user.update(fp_user_params)
      flash[:alert] = "更新されました。"
      redirect_to users_path
    else
      flash[:alert] = "更新に失敗しました。"
      redirect_to users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def fp_user_params
      params.require(:user).permit(:name, :email, :fp)
    end

    def fp_user
      redirect_to(root_url) unless current_user.fp?
    end
end
