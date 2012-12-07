#include <stdio.h>
#include <string.h>

int main(){
	char linhaOriginal[200], linhaSaida[200]; // linhas de entrada e saida
	FILE *entrada, *saida; // arquivos de entrada e saida
	int i, j; // variaveis auxiliares
	int aspas; // flag indicar se a variavel esta entre aspas ou nao
	int nomeCidade; // flag que indica se ainda esta no nome da cidade

	entrada = fopen("../brutos/lixo_coletado.csv", "r");
	saida = fopen("../tratados/lixo_coletado.csv", "w");

	while(fgets(linhaOriginal, 200, entrada) != NULL){
		// inicializando variaveis
		aspas = 0;
		j = 0;
		nomeCidade = 1;

		// mostrando a linha que foi lida
		printf("%s\n", linhaOriginal);
		linhaSaida[j] = '"';
		j++;

		for(i = 0; i < strlen(linhaOriginal); i++){
			// quebra o laço no \n
			if(linhaOriginal[i] == '\n'){
				linhaSaida[j] = '\0';
				break;
			}
			
			if(linhaOriginal[i] == ',' && nomeCidade == 1){
				nomeCidade = 0;
				linhaSaida[j] = '"';
				j++;
			}

			// se já foi lido o nome da cidade, só há numeros na linha
			if(linhaOriginal[i] == '"'){
				if(aspas == 1){
					aspas = 0;
				}else{
					aspas = 1;
				}
				continue;
			}

			if(aspas && linhaOriginal[i] == ','){
				linhaSaida[j] = '.';
				j++;
				continue;
			}
			// caso os parametros não sejam numeros ou não sejam espaços entre numeros, entram na saida
			if(linhaOriginal[i] != ' ' || nomeCidade){
				linhaSaida[j] = linhaOriginal[i];
				j++;
				continue;
			}

		}

		// inserindo ,2000 e \n no fim da linha e gravando no arquivo de saida
		fprintf(saida, "%s,2000\n", linhaSaida);

	}

	return 0;
}