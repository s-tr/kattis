#include <stdio.h>
#include <stdlib.h>

int main(void){
	int r,c;
	int** spaces;
	int count[5]={0};
	scanf("%d %d\n",&r,&c);
	spaces = calloc(r,sizeof(int*));
	for(int i=0;i<r;i++){
		spaces[i]=calloc(c,sizeof(int));
	}
	for(int i=0;i<r;i++){
		for(int j=0;j<c;j++){
			switch(getchar()){
				case '#':
					spaces[i][j]=999;
					break;
				case '.':
					spaces[i][j]=0;
					break;
				case 'X':
					spaces[i][j]=1;
					break;
			}
		}
		getchar();
	}
	for(int i=0;i<=r-2;i++){
		for(int j=0;j<=c-2;j++){
			int crush=spaces[i][j]+spaces[i][j+1]+spaces[i+1][j]+spaces[i+1][j+1];
			switch(crush){
				case 0:
				case 1:
				case 2:
				case 3:
				case 4:
					count[crush]++;
					break;
				default:
					break;
			}
		}
		getchar();
	}
	for(int i=0;i<5;i++){
		printf("%d\n",count[i]);
	}
}
