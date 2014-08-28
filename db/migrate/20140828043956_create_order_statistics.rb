class CreateOrderStatistics < ActiveRecord::Migration
  def change
    create_table :order_statistics do |t|
      t.belongs_to :order
      t.belongs_to :statistic
      t.timestamps
    end
  end
end
