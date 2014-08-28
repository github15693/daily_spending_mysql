class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.boolean :liquidate, default:0
      t.float :money_total

      t.timestamps
    end
  end
end
