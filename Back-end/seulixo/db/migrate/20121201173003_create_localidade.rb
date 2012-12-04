class CreateLocalidade < ActiveRecord::Migration
  def change
  	create_table :localidades do |t|
  		t.string :nome
  		t.integer :habitantes
  	end
  end

end

