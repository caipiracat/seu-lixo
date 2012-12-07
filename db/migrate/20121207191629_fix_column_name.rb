class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :garbages, :local_id, :locale_id
  end
end
