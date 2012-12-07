#include <stdio.h>
#include <string.h>

int main(){
	char linhaOriginal[200], linhaSaida[200]; // linhas de entrada e saida
	FILE *entrada, *saida; // arquivos de entrada e saida
	int i, j; // variaveis auxiliares
	int numerico; // flag indicar se a variavel atual é numérico ou não

	entrada = fopen("Lixocsv.csv", "r");
	saida = fopen("saidaLixo.csv", "w");

	while(fgets(linhaOriginal, 200, entrada) != NULL){
		// inicializando variaveis
		numerico = 0;
		j = 0;

		// mostrando a linha que foi lida
		printf("%s", linhaOriginal);

		for(i = 0; i < strlen(linhaOriginal); i++){
			// quebra o laço no \n
			if(linhaOriginal[i] == '\n'){
				linhaSaida[j] = '\0';
				break;
			}
			
			// se já foi lido o nome da cidade, só há numeros na linha
			if(linhaOriginal[i] == ','){
				numerico = 1;
			}

			// caso os parametros não sejam numeros ou não sejam espaços entre numeros, entram na saida
			if(numerico == 0 || numerico == 1 && linhaOriginal[i] != ' '){
				linhaSaida[j] = linhaOriginal[i];
				j++;
			}
		}

		// inserindo ,2000 e \n no fim da linha e gravando no arquivo de saida
		fprintf(saida, "%s,2000\n", linhaSaida);

	}

	return 0;
}