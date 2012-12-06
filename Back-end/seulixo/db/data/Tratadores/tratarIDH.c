#include <stdio.h>
#include <string.h>

int main(){
	char linhaOriginal[200], linhaSaida[200]; // linhas de entrada e saida
	FILE *entrada, *saida; // arquivos de entrada e saida
	int i, j; // variaveis auxiliares
	int ignorar; // flag para ignorar caracteres ou nao

	entrada = fopen("IDHmunicipio.csv", "r");
	saida = fopen("saidaIDH.csv", "w");

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
			// quebra o laço no \n
			if(linhaOriginal[i] == '\n'){
				linhaSaida[j-1] = '\0';
				break;
			}

			// caso os parametros estejam entre () são ignorados
			if(linhaOriginal[i] == '('){
				ignorar = 1;
				linhaSaida[j-1] = '"';
				continue;
			}
			if(linhaOriginal[i] == ')'){
				ignorar = 0;
				continue;
			}

			// caso os parametros não estejam entre () são inseridos no arquivo de saida
			if(ignorar == 0){
				linhaSaida[j] = linhaOriginal[i];
				j++;
			}else{
				continue;
			}
		}

		// inserindo ,2000 e \n no fim da linha e gravando no arquivo de saida
		fprintf(saida, "%s,2000\n", linhaSaida);

	}

	return 0;
}