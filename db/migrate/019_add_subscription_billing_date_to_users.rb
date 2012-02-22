class AddSubscriptionBillingDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription_billing_date, :string

  end
end
