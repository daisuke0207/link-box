class Records < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_boxes
  end
end
