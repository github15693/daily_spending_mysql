class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :desciption
      t.boolean :enabled, default: 1

      t.timestamps
    end
  end
end
