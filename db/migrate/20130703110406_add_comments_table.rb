class AddCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post
      t.references :user
      t.timestamps
    end
  end
end
