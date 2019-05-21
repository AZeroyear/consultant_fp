class PagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user
      if @user.fp
        @time_settings = TimeSetting.all
      end
    end
  end
end
