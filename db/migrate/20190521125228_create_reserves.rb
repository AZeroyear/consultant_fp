class CreateReserves < ActiveRecord::Migration[5.2]
  def change
    create_table :reserves do |t|
      t.date :date
      t.time :start
      t.time :end
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
