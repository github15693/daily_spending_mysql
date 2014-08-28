class CreateFunctionRoles < ActiveRecord::Migration
  def change
    create_table :function_roles do |t|
      t.string :desciption
      t.belongs_to :role
      t.belongs_to :function
      t.timestamps
    end
  end
end
