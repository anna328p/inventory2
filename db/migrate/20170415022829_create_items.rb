class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :item_type, foreign_key: true
      t.integer :inst_num
      t.boolean :checked_out
      t.integer :user_id
      t.string :notes

      t.timestamps
    end
  end
end
