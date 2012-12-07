class DropTables < ActiveRecord::Migration
  def up
    drop_table :lixos
    drop_table :localidades
    drop_table :idhs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
