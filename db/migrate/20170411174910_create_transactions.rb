class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.boolean :type
      t.string :notes
      t.integer :user_id
      t.integer :item_id
      t.integer :loan_days

      t.timestamps
    end
  end
end
