require 'nokogiri'
require 'open-uri'

#indices = [50,15,28,25,26,43,11,17,33,27,41,32,13,29,23,22,12,35,42,24,16,14,52,21,53,31,51]
indices = [12,27,16,13,29,23,53,32,52,21,51,50,31,15,25,41,26,22,33,24,43,11,14,42,35,28,17]
for indice in indices do
	for i in "A".."Z" do
		doc = Nokogiri::HTML(open('http://www.ibge.gov.br/home/estatistica/populacao/censo2000/universo.php?tipo=31o/tabela13_1.shtm&uf='+indice.to_s+'&letra='+ i.to_s))
		flag = false
		saida = ""
		doc.xpath('//td[@class="text9"]').each do | atributos |
		   if atributos.content.to_i == 0
		       saida = '"'+atributos.content+'",'
		       flag = true
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