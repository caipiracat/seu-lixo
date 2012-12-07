require 'csv'

class ImportLocalesData
  def read_in_csv_localidade
    csv_text = File.read('db/data/tratados/localidadeTratados.csv')

    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      locale = Locale.new
      locale.name = row[:name]
      locale.population = row[:population]
      locale.save
    end
  end

  def self.get_local_id(param_nome)
    local = Locale.where(name: param_nome)
    id = local.to_a.to_param.to_i
    id
  end
end
