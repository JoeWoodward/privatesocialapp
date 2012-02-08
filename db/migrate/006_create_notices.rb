class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :image
      t.string :title
      t.text :description
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
  end
end
