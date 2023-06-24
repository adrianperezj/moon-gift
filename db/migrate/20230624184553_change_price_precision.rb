class ChangePricePrecision < ActiveRecord::Migration[7.0]
  def change
    change_column :gifts, :price, :decimal, :precision => 8, :scale => 2
  end
end
