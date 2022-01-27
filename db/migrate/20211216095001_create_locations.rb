class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :title
      t.string :content
      t.string :category

      t.belongs_to :user, optional: true
      t.timestamps
    end
  end
end
