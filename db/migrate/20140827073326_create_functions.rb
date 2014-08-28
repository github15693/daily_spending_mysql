class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :controller
      t.string :action
      t.string :desciption
      t.boolean :enabled, default: 1

      t.timestamps
    end
  end
end
