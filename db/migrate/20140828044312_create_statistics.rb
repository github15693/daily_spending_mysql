class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.float :money_init, default:400
      t.float :money_last_week
      t.float :money_remain

      t.timestamps
    end
  end
end
