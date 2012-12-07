class CreateIdhs < ActiveRecord::Migration
  def change
    create_table :idhs do |t|
      t.string :idhm
      t.float :income
      t.float :longevity
      t.float :education
      t.string :year
      t.references :locale

      t.timestamps
    end
    add_index :idhs, :locale_id
  end
end
