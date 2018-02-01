#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem onechicken
 * 
 * Difficulty: 1.5
 * Solved:     2018-01-15
 */

int main(){
	int a,b;
	scanf("%d %d",&a,&b);
	if(a>b){
		if((a-b)==1) {
			printf("Dr. Chaz needs 1 more piece of chicken!\n");
		} else {
			printf("Dr. Chaz needs %d more pieces of chicken!\n",a-b);
		}
	} else {
		if((b-a)==1) {
			printf("Dr. Chaz will have 1 piece of chicken left over!\n");
		} else {
			printf("Dr. Chaz will have %d pieces of chicken left over!\n",b-a);
		}
	}
}
