class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.float :price
      t.integer :quantity, default:1
      t.float :money_total
      t.belongs_to :good
      t.belongs_to :order
      t.timestamps
    end
  end
end
