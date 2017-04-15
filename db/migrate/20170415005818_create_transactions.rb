class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.boolean :transaction_type
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.text :notes
      t.integer :loan_time

      t.timestamps
    end
  end
end
