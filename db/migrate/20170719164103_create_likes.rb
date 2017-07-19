class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :like_type
      t.string :like_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
