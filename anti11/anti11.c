#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem anti11
 * 
 * Difficulty: 2.7
 * Solved:     2018-01-25
 */

#define MODULUS 1000000007

int* fibArr;

void init(){
	fibArr=calloc(10003,sizeof(int));
	fibArr[2]=fibArr[1]=1;
}

int fib(int x){
	if(x==0){
		return 0;
	} else if(fibArr[x]!=0){
		return fibArr[x];
	} else {
		int result=fib(x-1)+fib(x-2);
		fibArr[x]=result%MODULUS;
		return fibArr[x];
	}
}

int main(){
	init();
	int n;
	scanf("%d",&n);
	for(int _=0;_<n;_++){
		int i;
		scanf("%d",&i);
		printf("%d\n",fib(i+2));
	}
}
