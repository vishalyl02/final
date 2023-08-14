class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :likes
      t.integer :comments
      t.integer :views
      t.string :author

      t.timestamps
    end
  end
end
