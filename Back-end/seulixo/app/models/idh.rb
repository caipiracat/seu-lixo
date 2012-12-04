#encoding: UTF-8
require "csv"

class Idh < ActiveRecord::Base
  attr_accessible :owner,:idhm,:renda,:longevidade,:educacao,:ano

	def read_in_csv_idh
		csv_text = File.read('saidaIDH.csv')
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
			Idh.create!(row.to_hash.symbolize_keys)
		end
	end	 


end
