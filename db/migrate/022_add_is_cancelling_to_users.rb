class AddIsCancellingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_cancelling, :boolean

  end
end
