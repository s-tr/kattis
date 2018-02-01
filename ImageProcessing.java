import java.util.*;
import java.io.*;

/**
 * Kattis problem imageprocessing
 * 
 * Difficulty: 2.3
 * Solved:     2018-01-23
 */

public class ImageProcessing {
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		int h0,w0,n,m;
		int h1,w1;
		h0 = sc.nextInt();
		w0 = sc.nextInt();
		n  = sc.nextInt();
		m  = sc.nextInt();
		h1 = h0-n+1;
		w1 = w0-m+1;
		int[][] original = new int[h0][w0];
		int[][] kernel   = new int[n][m];
		int[][] changed  = new int[h1][w1];
		
		for(int i=0;i<h0;i++){
			for(int j=0;j<w0;j++){
				original[i][j]=sc.nextInt();
			}
		}
		
		for(int i=n-1;i>=0;i--){
			for(int j=m-1;j>=0;j--){
				kernel[i][j]=sc.nextInt();
			}
		}
		
		for(int i=0;i<h1;i++){
			for(int j=0;j<w1;j++){
				int accum=0;
				for(int ii=0;ii<n;ii++){
					for(int jj=0;jj<m;jj++){
						accum+=kernel[ii][jj]*original[i+ii][j+jj];
					}
				}
				changed[i][j]=accum;
			}
		}
		
		for(int i=0;i<h1;i++){
			for(int j=0;j<w1;j++){
				System.out.print(changed[i][j]);
				System.out.print(' ');
			}
			System.out.println();
		}
	}
}
