class CreateDateExpiries < ActiveRecord::Migration
  def change
    create_table :date_expiries do |t|
      t.date :date_expiry
      t.boolean :completed, default:0

      t.timestamps
    end
  end
end
