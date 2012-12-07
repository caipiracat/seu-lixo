class AddSlugToLocales < ActiveRecord::Migration
  def change
    add_column :locales, :slug, :string
    add_index :locales, :slug, unique: true
  end
end
