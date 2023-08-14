class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings do |t|
      t.string :category
      t.string :title
      t.text :content
      t.string :author
      t.string :reading_time

      t.timestamps
    end
  end
end
