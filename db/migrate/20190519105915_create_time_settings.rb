class CreateTimeSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :time_settings do |t|
      t.integer :weekly
      t.integer :interval
      t.time :start
      t.time :end
      t.boolean :workday, default: true
      t.timestamps
    end
  end
end
