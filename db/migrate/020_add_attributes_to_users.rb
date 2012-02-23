class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :string

    add_column :users, :date_of_birth, :date

    add_column :users, :house, :string

    add_column :users, :town, :string

    add_column :users, :post_code, :string

    add_column :users, :telephone, :string

    add_column :users, :mobile, :string

  end
end
