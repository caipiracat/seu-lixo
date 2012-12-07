class ImportIdhData
  def read_in_csv_idh
    csv_text = File.read('saidaIDH.csv')
    csv = CSV.parse(csv_text, :headers => true)

    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      localidade = Locale.new
      localidade.name = row[:nome]

      lnome = localidade.name

      id = Locale.get_local_id(lnome)

      if id == 0
        localidade.save
        id = localidade.id
      end

      row.delete(:nome)

      row[:owner] = id
      Idh.create!(row.to_hash.symbolize_keys)
    end
  end
end