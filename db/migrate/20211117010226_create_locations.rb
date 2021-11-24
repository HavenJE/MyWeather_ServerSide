class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :title
      t.string :content
      t.string :user
      t.string :category

      t.timestamps
    end
  end
end
