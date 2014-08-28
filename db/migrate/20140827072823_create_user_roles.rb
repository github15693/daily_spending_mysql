class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :desciption
      t.belongs_to :user
      t.belongs_to :role
      t.timestamps
    end
  end
end
