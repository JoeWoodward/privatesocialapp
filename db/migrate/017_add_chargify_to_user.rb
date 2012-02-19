class AddChargifyToUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string

    add_column :users, :state, :string

    add_column :users, :chargify_subscription_id, :string

  end
end
