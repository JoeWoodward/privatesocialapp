class AddActivatedAtToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :activated_at, :timestamp

  end
end
