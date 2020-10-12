class CreateBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :boxes do |t|
      t.string :name, null: false
      t.integer :position, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
