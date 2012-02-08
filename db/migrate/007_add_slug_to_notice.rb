class AddSlugToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :slug, :string
    add_index :notices, :slug
  end
end
