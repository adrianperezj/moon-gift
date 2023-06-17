class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :gift, null: false, foreign_key: true
      t.string :payment_method
      t.decimal :total

      t.timestamps
    end
  end
end
