class CreateDeletehistories < ActiveRecord::Migration[6.0]
  def change
    create_table :deletehistories do |t|
      t.string :title, null: false
      t.string :link, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
