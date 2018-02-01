#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem okviri
 * 
 * Difficulty: 1.8
 * Solved:     2018-01-17
 */

int main(){
	char *str = calloc(17,1);
	scanf("%s",str);
	int len = strlen(str);
	char frame[5][4*len+2];
	for(int i=0;i<5;i++){
		memset(frame[i],'.',4*len+1);
		frame[i][4*len+1]='\0';
	}
	for(int i=0;i<len;i++){
		frame[0][4*i+2]=frame[1][4*i+1]=frame[1][4*i+3]=frame[2][4*i]=
		frame[2][4*i+4]=frame[3][4*i+1]=frame[3][4*i+3]=frame[4][4*i+2]='#';
		frame[2][4*i+2]=str[i];
	}
	for(int i=2;i<len;i+=3){
		frame[0][4*i+2]=frame[1][4*i+1]=frame[1][4*i+3]=frame[2][4*i]=
		frame[2][4*i+4]=frame[3][4*i+1]=frame[3][4*i+3]=frame[4][4*i+2]='*';
	}
	for(int i=0;i<5;i++){
		puts(frame[i]);
	}
}
