class CreateConsultants < ActiveRecord::Migration[5.2]
  def change
    create_table :consultants do |t|
      t.integer :reserve_id
      t.integer :fp_user_id
      t.integer :user_id

      t.timestamps
    end
  end
end
