class CreateFestivals < ActiveRecord::Migration[7.0]
  def change
    create_table :festivals do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :prefecture, null: false
      t.string :region, null: false
      t.timestamps
    end
  end
end
