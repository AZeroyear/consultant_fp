class PagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user
      @consultant = @user.reserve.order(:date).order(:start)
      if @user.fp
        @fp_consultants = @user.fp_reserves.where.not(consultants: {user_id: nil}).order("date").order("start")
      end
    end
  end
end
