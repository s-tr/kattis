#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PI 3.14159265358979323846

/**
 * Kattis problem happytrails
 * 
 * Difficulty: 1.9
 * Solved:     2017-11-17
 */

int main(void){
	int n;
	double total=0.0;
	scanf("%d\n",&n);
	for(int i=0;i<n;i++){
		double angle, distance;
		scanf("%lf %lf\n",&angle,&distance);
		total+=distance*sin(angle*PI/180);
	}
	printf("%.2f",total);
}
