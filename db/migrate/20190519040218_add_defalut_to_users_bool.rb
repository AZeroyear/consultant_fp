class AddDefalutToUsersBool < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :fp, false
  end
end
