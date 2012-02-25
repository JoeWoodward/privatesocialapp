class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.string :slug

      t.timestamps
    end
    add_index :partners, :slug
  end
end
