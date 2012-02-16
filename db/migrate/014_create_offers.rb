class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.string :image
      t.boolean :active
      t.string :slug

      t.timestamps
    end
    add_index :offers, :slug
  end
end
