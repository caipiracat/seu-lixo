require "csv"

class Lixo < ActiveRecord::Base
  attr_accessible :owner, :total, :ceu_aberto,:areas_alagadas,:aterro_controlado,:aterro_sanitario
  attr_accessible :compostagem, :triagem,:incineracao,:nao_fixo,:outros,:ano

  	def read_in_csv_lixo
  		csv_text = File.read('saidaLixo.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|

			row = row.to_hash.with_indifferent_access

			@localidade = Localidade.new
			@localidade.nome = row[:nome]

			lnome = @localidade.nome

			id = Localidade.get_local_id(lnome)
			
			if id == 0	
				@localidade.save
				id = @localidade.id
			end
			row.delete(:nome)
				
			row[:owner] = id		
			Lixo.create!(row.to_hash.symbolize_keys)
		end
	end
 	

  def self.porcentagem 

  end
end
