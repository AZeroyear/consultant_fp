module TimeSettingsHelper
  def week(week_number)
    %w(日 月 火 水 木 金 土)[week_number]
  end
end
