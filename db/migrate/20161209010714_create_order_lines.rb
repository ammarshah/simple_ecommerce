class CreateOrderLines < ActiveRecord::Migration[5.0]
  def change
    create_table :order_lines do |t|
      t.integer :qty
      t.float :unit_price
      t.float :total_price
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
