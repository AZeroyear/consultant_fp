class AddfpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fp, :boolean
  end
end
