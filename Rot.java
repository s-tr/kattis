import java.util.*;
import java.io.*;

/**
 * Kattis problem rot
 * 
 * Difficulty: 2.5
 * Solved:     2018-01-22
 */

public class Rot {
	public static void main(String[] args){
		Scanner sc=new Scanner(System.in);
		int r0,c0;
		r0=sc.nextInt();
		c0=sc.nextInt();
		sc.nextLine();
		char[][] initial = new char[r0][];
		for(int i=0;i<r0;i++){
			initial[i]=sc.nextLine().trim().toCharArray();
		}
		int rotation = sc.nextInt();
		int rtAngles = rotation/90;
		boolean isDiagonal = (rotation%90!=0);
		switch(rtAngles){
			case 0:
			case 4:
				break;
			case 1: {
				char[][] newArr = new char[c0][r0];
				for(int r=0;r<r0;r++){
					for(int c=0;c<c0;c++){
						newArr[c][r0-1-r]=initial[r][c];
					}
				}
				int temp=c0;
				c0=r0;
				r0=temp;
				initial=newArr;
			} break;
			case 2: {
				char[][] newArr = new char[r0][c0];
				for(int r=0;r<r0;r++){
					for(int c=0;c<c0;c++){
						newArr[r0-1-r][c0-1-c]=initial[r][c];
					}
				}
				initial=newArr;
			} break;
			case 3: {
				char[][] newArr = new char[c0][r0];
				for(int r=0;r<r0;r++){
					for(int c=0;c<c0;c++){
						newArr[c0-1-c][r]=initial[r][c];
					}
				}
				initial=newArr;
				int temp=c0;
				c0=r0;
				r0=temp;
			} break;
			default: {
				throw new RuntimeException("This is impossible!");
			}
		}
		if(isDiagonal){
			char[][] newArr=new char[r0+c0-1][r0+c0-1];
			for(char[] line:newArr){
				Arrays.fill(line,' ');
			}
			for(int r=0;r<r0;r++){
				for(int c=0;c<c0;c++){
					newArr[r+c][r0-1-r+c]=initial[r][c];
				}
			}
			initial=newArr;
		}
		for(char[] line: initial){
			System.out.println(new String(line));
		}
	}
}
