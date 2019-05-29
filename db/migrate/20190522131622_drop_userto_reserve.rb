class DropUsertoReserve < ActiveRecord::Migration[5.2]
  def change
    remove_column :reserves, :user_id
  end
end
