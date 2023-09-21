class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name , null: false
      t.text :introduction , null: false
      t.string :image_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
