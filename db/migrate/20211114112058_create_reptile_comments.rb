class CreateReptileComments < ActiveRecord::Migration[5.2]
  def change
    create_table :reptile_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :reptile_id

      t.timestamps
    end
  end
end
