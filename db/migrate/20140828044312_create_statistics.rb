class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.float :money_init, default:400
      t.float :money_last_week, default:0
      t.float :money_remain, default:0
      t.float :money_payment, default:0

      t.timestamps
    end
  end
end
