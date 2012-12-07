require 'csv'

class ImportGarbageData
  def read_in_csv_lixo
    csv_text = File.read('db/data/tratados/lixoColetadoCidades.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      row = row.to_hash.with_indifferent_access

      @localidade = Locale.new
      @localidade.name = row[:name]

      lnome = @localidade.name

      id = Locale.get_local_id(lnome)

      if id == 0
        @localidade.save
        id = @localidade.id
      end

      row.delete(:name)

      row[:owner] = id
      Garbage.create!(row.to_hash.symbolize_keys)
    end
  end
end
