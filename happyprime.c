#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem (name)
 * 
 * Difficulty: 0.0
 * Solved:     no
 */
#define UNSET 0
#define VISIT 1
#define HAPPY 2
#define SAD   3

int sieve[10001];
int happy[10001];

void init(){
	memset(sieve,1,10001*sizeof(int));
	memset(happy,0,10001*sizeof(int));
	
	sieve[0]=0;
	sieve[1]=0;
	
	for(int i=0;i<123;i++){
		if(sieve[i]==0) continue;
		
		for(int j=2*i;j<10001;j+=i){
			sieve[j]=0;
		}
	}
	
	happy[0]=SAD;
	happy[1]=HAPPY;
	happy[4]=SAD;
	for(int i=0;i<10001;i++){
		is_happy(i);
	}
}

int next(int s){
	char m[8];
	sprintf(m,"%d",s);
	char *p=m;
	int accum=0;
	while(*p){
		int n=(*p)-'0';
		accum+=n*n;
		p++;
	}
	return accum;
}

int is_happy(int i){
	switch(happy[i]){
		case HAPPY:
			return 1;
		case SAD:
			return 0;
		case VISIT:
			// we got caught in a loop!
			return 0;
		case UNSET:
			// calculate next value
			happy[i]=VISIT;
			int nextI = next(i);
			if(is_happy(nextI)){
				happy[i]=HAPPY;
				return 1;
			} else {
				happy[i]=SAD;
				return 0;
			}
		default:
			return 0;
	}
}

int main(){
	init();
	
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;i++){
		int x;
		scanf("%*d");
		scanf("%d",&x);
		printf("%d %d ",i+1,x);
		if(sieve[x]&&is_happy(x)){
			puts("YES");
		} else {
			puts("NO");
		}
	}
}
