#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/**
 * Kattis problem height
 * 
 * Difficulty: 1.8
 * Solved:     2017-11-24
 */

int main(void){
	int n_sets;
	scanf("%d\n",&n_sets);
	int height[20];
	for(int i=1;i<=n_sets;i++){
		int count=0;
		scanf("%*d");
		for(int j=0;j<20;j++){
			scanf("%d",&height[j]);
		}
		for(int j=1;j<20;j++){
			for(int k=j-1;k>=0;k--){
				if(height[k]>height[k+1]){
					count++;
					int temp=height[k];
					height[k]=height[k+1];
					height[k+1]=temp;
				} else {
					break;
				}
			}
		}
		printf("%d %d\n",i,count);
	}
}
