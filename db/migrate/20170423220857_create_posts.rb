class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :post
      t.references :postable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
