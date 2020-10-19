class CreateConnects < ActiveRecord::Migration[6.0]
  def change
    create_table :connects do |t|
      t.string :title, null: false
      t.string :link, null: false
      t.integer :position, null: false
      t.references :user, foreign_key: true
      t.references :box, foreign_key: true
      t.timestamps
    end
  end
end
