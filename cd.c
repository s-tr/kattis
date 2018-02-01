#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem cd
 * 
 * Difficulty: 4.2
 * Solved:     2017-12-03
 */
 
void f(){
	int n;
	for(int i=0;i<10;i++){
		scanf("%d",&n);
		printf("%d\n",n);
	}
	exit(0);
}

int main(){
	int* storage = malloc(2000000*sizeof(int));
	int* as      = storage + 0;
	int* bs      = storage + 1000000;
	while(1){
		int nA, nB;
		scanf("%d %d\n",&nA,&nB);
		if(nA==0 && nB==0){
			exit(0);
		}
		for(int i=0;i<nA;i++){
			scanf("%d\n",&as[i]);
		}
		for(int i=0;i<nB;i++){
			scanf("%d\n",&bs[i]);
		}
		int count=0;
		int index=0;
		int finished=0;
		if(nA==0) goto nextLoop;
		for(int i=0;i<nB;i++){
			int n=bs[i];
			while(as[index]<n){
				index++;
				if(index==nA){
					goto nextLoop;
				}
			}
			if(as[index]==n){
				count++;
			}
		}
		nextLoop: ;
		printf("%d\n",count);
	}
}
