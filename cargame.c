#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem - Car Game
 * 
 * Difficulty: 5.8
 * Solved:     yes
 * Date:       2017-11-17
 */

int main(){
	int dictionary[26][26][26];
	char** words;
	int num_words, num_queries;
	int i,j,k,l;
	for(i=0;i<26;i++){
		for(j=0;j<26;j++){
			for(k=0;k<26;k++){
				dictionary[i][j][k]=0;
			}
		}
	}
	scanf("%d %d\n",&num_words,&num_queries);
	words = malloc((num_words+1)*sizeof(char*));
	words[0]="No valid word";
	for(i=1;i<num_words+1;i++){
		char* line=malloc(102*sizeof(char));
		fgets(line,102,stdin);
		int len=strlen(line);
		line[len-1]='\0';
		len--;
		for(j=0;j<len;j++){
			for(k=j+1;k<len;k++){
				for(l=k+1;l<len;l++){
					int c1=line[j]-97, c2=line[k]-97, c3=line[l]-97;
					if(dictionary[c1][c2][c3]==0){
						dictionary[c1][c2][c3]=i;
					}
				}
			}
		}
		words[i]=line;
	}
	
	char query[5];
	for(i=0;i<num_queries;i++){
		fgets(query,5,stdin);
		int c1=query[0]-65, c2=query[1]-65, c3=query[2]-65;
		puts(words[dictionary[c1][c2][c3]]);
	}
	
	return 0;
}
