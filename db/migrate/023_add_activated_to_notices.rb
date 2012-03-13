class AddActivatedToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :activated, :boolean

  end
end
