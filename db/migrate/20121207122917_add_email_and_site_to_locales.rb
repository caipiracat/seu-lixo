class AddEmailAndSiteToLocales < ActiveRecord::Migration
  def change
    add_column :locales, :email, :string
    add_column :locales, :site, :string
  end
end
