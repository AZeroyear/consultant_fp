class RenameWeeklyColumnToTimeSettings < ActiveRecord::Migration[5.2]
  def change
    rename_column :time_settings, :weekly, :week
  end
end
