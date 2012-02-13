class AddSlugToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :slug, :string
    add_index :faqs, :slug
  end
end
