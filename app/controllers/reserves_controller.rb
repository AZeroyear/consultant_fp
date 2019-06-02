class ReservesController < ApplicationController
  before_action :logged_in_fp_user
  before_action :set_up

  def index
  end

  def create
    reserve_id_range = reserve_params[:id_set].split(" ")

    fp_reserve = @fp_user.fp_consultants.where(reserve_id: reserve_id_range[0]..reserve_id_range[1])
    fp_reserve.each do |res|
      if !reserve_params[:fp_reserf_ids].include?(res.reserve_id.to_s)
        if res.user_id.nil?
          res.destroy
        else
          flash[:danger] = "#{Reserve.find(res.reserve_id).start.strftime('%H:%M')}開始は予約済の時間です"
        end
      end
    end
    reserve_params[:fp_reserf_ids].each do |res_id|
      if fp_reserve.where(reserve_id: res_id).empty?
        @fp_user.fp_consultants.create!(reserve_id: res_id) unless res_id.empty?
      end
    end
    render 'index'
  end

  private
    def reserve_params
      params.require(:user).permit(:id_set, {fp_reserf_ids: []})
    end

    def set_up
      @day = params[:date] ? Date.parse(params[:date]) : Date.current
      if @day < Date.current
        @day = Date.current
        flash[:alert] = "過去の日付は選択できません"
      end
      @set_time = TimeSetting.set(@day)
      @fp_user = current_user
    end
end
