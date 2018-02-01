#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem anothecandies
 * 
 * Difficulty: 2.7
 * Solved:     2018-01-25
 */

int main(){
	int t;
	scanf("%d",&t);
	for(int _=0;_<t;_++){
		long nChildren, temp, sum=0;
		scanf("%d",&nChildren);
		for(int i=0;i<nChildren;i++){
			scanf("%ld",&temp);
			sum+=(temp%nChildren);
		}
		if(sum%nChildren==0){
			puts("YES");
		} else {
			puts("NO");
		}
	}
}
