class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.float :price, default:0

      t.timestamps
    end
  end
end
