class ConsultantsController < ApplicationController
  before_action :logged_in_user
  def index
    @consultants = Reserve.where('date >= ?', Date.current).joins(:consultants).includes(:consultants).where(consultants: {user_id: nil}).order("date").order("start")
  end

  def show
    @consultant = Consultant.where(user_id: nil).find_by(reserve_id: params[:id])
    @reserve = @consultant.reserve
  end

  def update
    consultant = Consultant.find(params[:id])
    consultant.user_id = current_user.id
    if consultant.save!
      flash[:alert] = "予約が完了しました!!"
      redirect_to root_path
    else
      flash[:alert] = "すでに他の人に予約された可能性があります。違う日を選択してください"
      render index
    end
  end

  def destroy
    cos = current_user.consultant.find_by(reserve_id: params[:id])
    cos.user_id = nil
    if cos.save
      flash[:alert] = "キャンセルが完了しました"
    else
      flash[:alert] = "キャンセルが失敗しました"
    end
    redirect_to root_path
  end
end
