class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
=begin
  def up
    create_table :posts do |t|
      t.string :title, null:false
      t.text :body, null: false

      t.timestamps
    end
  end

 def down
    drop_table :posts
  end

=end

end
