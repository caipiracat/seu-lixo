#include <stdio.h>
#include <string.h>

int main(){
	char linhaOriginal[200], linhaSaida[200]; // linhas de entrada e saida
	FILE *entrada, *saida; // arquivos de entrada e saida
	int i, j; // variaveis auxiliares
	int ignorar; // flag para ignorar caracteres ou nao

	entrada = fopen("../brutos/idhm2000.csv", "r");
	saida = fopen("../tratados/idhm2000.csv", "w");

	while(fgets(linhaOriginal, 200, entrada) != NULL){
		// inicializando variaveis
		ignorar = 0;
		j = 0;

		// mostrando a linha que foi lida
		printf("%s", linhaOriginal);

		// colocando " no inicio do nome da cidade
		linhaSaida[j] = '"';
		j++;

		for(i = 0; i < strlen(linhaOriginal); i++){
			if(linhaOriginal[i] == '('){
				linhaSaida[j-1] = '"';
				linhaSaida[j] = ',';
				j++;
				linhaSaida[j] = '"';
				j++;
				continue;
			}
			if(linhaOriginal[i] == ')'){
				linhaSaida[j] = '"';
				j++;
				continue;
			}
			if(linhaOriginal[i] == '\n'){
				linhaSaida[j-1] = '\0';
				break;
			}
			linhaSaida[j] = linhaOriginal[i];
			j++;

		}

		// inserindo ,2000 e \n no fim da linha e gravando no arquivo de saida
		fprintf(saida,"%s,2000\n", linhaSaida);

	}

	return 0;
}