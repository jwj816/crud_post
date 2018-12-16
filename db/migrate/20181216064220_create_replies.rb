class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :Editor
      t.text :Content
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
