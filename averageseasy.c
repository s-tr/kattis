#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem averageseasy
 * 
 * Difficulty: 2.5
 * Solved:     2018-01-25
 */

int main(){
	int t;
	scanf("%d",&t);
	
	for(int _=0;_<t;_++){
		int ncs,ne;
		scanf("%d %d",&ncs,&ne);
		int* cs;
		int _e;
		cs=malloc(ncs*sizeof(int));
		long tot_cs=0, tot_e=0;
		for(int i=0;i<ncs;i++){
			scanf("%d",&cs[i]);
			tot_cs+=cs[i];
		}
		for(int i=0;i<ne;i++){
			scanf("%d",&_e);
			tot_e+=_e;
		}
		int nFunny=0;
		for(int i=0;i<ncs;i++){
			int score=cs[i];
			if(score*ncs < tot_cs && score*ne > tot_e){
				nFunny++;
			}
		}
		printf("%d\n",nFunny);
		free(cs);
	}
}
