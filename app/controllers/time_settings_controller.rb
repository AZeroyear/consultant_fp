class TimeSettingsController < ApplicationController
  def edit
    @time_settings = TimeSetting.all
  end

  def update
    setting_params.keys.each do |id|
      set = TimeSetting.find(id)
      set.update_attributes(setting_params[id])
    end
    @time_settings = TimeSetting.all
    render 'edit'
  end

  private
    def setting_params
      params.permit(setting: [:interval, :start, :end, :workday])[:setting]
    end
end
