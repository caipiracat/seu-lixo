require 'csv'

class ImportGarbageData
  def read_in_csv_lixo
    csv_text = File.read('db/data/tratados/lixoColetadoCidades.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      row = row.to_hash.with_indifferent_access

      @localidade = Locale.new
      @localidade.name = row[:name]
      @localidade.state = row[:state]

      id = Locale.where(:name => @localidade.name, :state => @localidade.state).first.id

      if id == 0
        @localidade.save
        id = @localidade.id
      end

      row.delete(:name)
      row.delete(:state)

      row[:locale_id] = id
      Garbage.create!(row.to_hash.symbolize_keys)
    end
  end
end
