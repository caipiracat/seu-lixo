require 'nokogiri'
require 'open-uri'

#indices = [50,15,28,25,26,43,11,17,33,27,41,32,13,29,23,22,12,35,42,24,16,14,52,21,53,31,51]
indices = {
	"12" => "AC",
	"27" => "AL",
	"16" => "AP",
	"13" => "AM",
	"29" => "BA",
	"23" => "CE",
	"53" => "DF",
	"32" => "ES",
	"52" => "GO",
	"21" => "MA",
	"51" => "MT",
	"50" => "MS",
	"31" => "MG",
	"15" => "PA",
	"25" => "PB",
	"41" => "PR",
	"26" => "PE",
	"22" => "PI",
	"33" => "RJ",
	"24" => "RN",
	"43" => "RS",
	"11" => "RO",
	"14" => "RR",
	"42" => "SC",
	"35" => "SP",
	"28" => "SE",
	"17" => "TO"
}

for indice in indices.keys do
	for i in "A".."Z" do
		doc = Nokogiri::HTML(open('http://www.ibge.gov.br/home/estatistica/populacao/censo2000/universo.php?tipo=31o/tabela13_1.shtm&uf='+indice.to_s+'&letra='+ i.to_s))
		flag = false
		saida = ""
		doc.xpath('//td[@class="text9"]').each do | atributos |
		   if atributos.content.delete('.').match(/\D/)
		       saida = '"'+atributos.content+'",'
		       flag = true
		       saida += '"' + indices[indice].to_s + '",'
		       next
		   end
		   if flag == true
		       atributos.content = atributos.content.delete('.')
		       for c in 'a'..'Z' do
				  atributos.content = atributos.content.delete(c)
		       end
		       saida += atributos.content
		       puts saida
		       flag = false
		   end
		end
	end
end
