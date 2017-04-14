class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :item_type_id
      t.integer :inst_num
      t.boolean :checked_out
      t.integer :user_id
      t.text :notes

      t.timestamps
    end
  end
end
