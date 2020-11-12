class CreateDeletehistories < ActiveRecord::Migration[6.0]
  def change
    create_table :deletehistories do |t|
      t.references :connect, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
