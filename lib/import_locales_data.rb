class ImportLocalesData
  def read_in_csv_localidade
    csv_text = File.read('habitantesTotal.csv')

    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      locale = Locale.new
      locale.name = row[:nome]
      locale.population = row[:habitantes]
      locale.save
    end
  end

  def self.get_local_id(param_nome)
    local = Locale.where(name: param_nome)
    id = local.to_a.to_param.to_i
    id
  end
end
