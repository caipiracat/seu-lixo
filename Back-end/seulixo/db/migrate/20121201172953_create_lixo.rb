class CreateLixo < ActiveRecord::Migration
  def change
  	create_table :lixos do |t|
      t.integer :owner
  		t.float :total
  		t.float :ceu_aberto
  		t.float :areas_alagadas
  		t.float :aterro_controlado
  		t.float :aterro_sanitario
  		t.float :compostagem
  		t.float :triagem
  		t.float :incineracao
  		t.float :nao_fixo
  		t.float :outros
    t.integer :ano
    end
  end

  #def down
  #end
end


