class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'E-mailアドレスが登録されていません。もう一度登録したE-mailアドレスかご確認ください'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
