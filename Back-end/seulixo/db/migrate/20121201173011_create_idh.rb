class CreateIdh < ActiveRecord::Migration
  def change
  	create_table :idhs do |t|
		t.integer :owner
  		t.float :idhm
  		t.float :renda
  		t.float :longevidade
  		t.float :educacao
  		t.integer :ano
  	end
  end

  
end
