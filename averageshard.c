#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem averageshard
 * 
 * Difficulty: 3.0
 * Solved:     2018-01-25
 */

int main(){
	int t;
	scanf("%d",&t);
	
	for(int _=0;_<t;_++){
		long ncs,ne;
		scanf("%ld %ld",&ncs,&ne);
		long* cs;
		long _e;
		cs=malloc(ncs*sizeof(long));
		long tot_cs=0, tot_e=0;
		for(int i=0;i<ncs;i++){
			scanf("%ld",&cs[i]);
			tot_cs+=cs[i];
		}
		for(int i=0;i<ne;i++){
			scanf("%ld",&_e);
			tot_e+=_e;
		}
		int nFunny=0;
		for(int i=0;i<ncs;i++){
			long score=cs[i];
			if(score*ncs < tot_cs && score*ne > tot_e){
				nFunny++;
			}
		}
		printf("%d\n",nFunny);
		free(cs);
	}
}
