class CreateReptiles < ActiveRecord::Migration[5.2]
  def change
    create_table :reptiles do |t|
      t.text :title
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
