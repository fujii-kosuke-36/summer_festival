class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false # 外部キー (User)
      t.timestamps
    end
  end
end
