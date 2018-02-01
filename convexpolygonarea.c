#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Kattis problem convexpolygonarea
 * 
 * Difficulty: 2.1
 * Solved:     2018-01-17
 */

int main(){
	int n_polys,n_sides;
	int x[101];
	int y[101];
	scanf("%d\n",&n_polys);
	for(int i=0;i<n_polys;i++){
		scanf("%d ",&n_sides);
		for(int j=0;j<n_sides;j++){
			scanf("%d %d ",&x[j],&y[j]);
		}
		x[n_sides]=x[0];
		y[n_sides]=y[0];
		int total=0;
		for(int j=0;j<n_sides;j++){
			total+=x[j]*y[j+1]-y[j]*x[j+1];
		}
		printf("%f\n",0.5*abs(total));
	}
			
}
