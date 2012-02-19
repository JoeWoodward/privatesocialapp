class AddLandscapeToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :landscape, :boolean
  end
end
