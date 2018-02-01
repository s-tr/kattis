#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem aboveaverage
 * 
 * Difficulty: 2.1
 * Solved:     2017-11-24
 */

int main(){
	int n;
	scanf("%d\n",&n);
	for(int i=0;i<n;i++){
		int m;
		int* grades;
		int total=0;
		int count=0;
		scanf("%d\n",&m);
		grades=calloc(m,sizeof(int));
		for(int j=0;j<m;j++){
			scanf("%d",&grades[j]);
			total+=grades[j];
		}
		for(int j=0;j<m;j++){
			if(grades[j]*m>total){
				count++;
			}
		}
		printf("%.3f%%\n",100.0*count/m);
	}
}
