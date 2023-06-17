class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
