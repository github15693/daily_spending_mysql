class CreateGroupChatLists < ActiveRecord::Migration
  def change
    create_table :group_chat_lists do |t|
      t.string :name, default: Time.now.strftime('ID %d/%m/%Y %H:%M:%S')

      t.timestamps
    end
  end
end
