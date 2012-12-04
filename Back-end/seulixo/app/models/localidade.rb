require "csv"

class Localidade < ActiveRecord::Base
  attr_accessible :nome, :habitantes
  validates_uniqueness_of :nome

  def read_in_csv_localidade
  	csv_text = File.read('habitantesTotal.csv')
  	csv = CSV.parse(csv_text, :headers => true)
  	
  	csv.each do |row|
      row = row.to_hash.with_indifferent_access
  		@localidade = Localidade.new
  		@localidade.nome = row[:nome]
      @localidade.habitantes = row[:habitantes]
      @localidade.save
  	end	
  end

  def self.get_local_id(param_nome)
  	local = Localidade.where(:nome => param_nome)
  	id = local.to_a.to_param.to_i
  	id
  end
end
