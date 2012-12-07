class CreateGarbages < ActiveRecord::Migration
  def change
    create_table :garbages do |t|
      t.float :total
      t.float :open_air
      t.float :wetlands
      t.float :landfill
      t.float :sanitary_landfill
      t.float :composting
      t.float :screening
      t.float :incineration
      t.float :not_fixed
      t.float :others
      t.string :year
      t.references :local

      t.timestamps
    end
    add_index :garbages, :local_id
  end
end
