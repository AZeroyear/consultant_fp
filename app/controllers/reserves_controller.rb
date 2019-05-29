class ReservesController < ApplicationController
  before_action :logged_in_fp_user
  before_action :set_up

  def index

  end

  def create
    @fp_user.update(reserve_params)
    render 'index'
  end

  def update
    current_user.update(reserve_params)
  end

  private
    def reserve_params
      params.require(:user).permit({fp_reserf_ids: []})
    end

    def set_up
      @day = params[:date] ? Date.parse(params[:date]) : Date.today
      @set_time = TimeSetting.set(@day)
      @fp_user = current_user
    end
end
