import java.util.*;
import java.io.*;

/**
 * Kattis problem cokolada
 * 
 * Difficulty: 2.0
 * Solved:     2017-11-25
 */

public class Cokolada {
	public static void main(String[] args){
		int numSquares = new Scanner(System.in).nextInt();
		int size = (32-Integer.numberOfLeadingZeros(numSquares-1));
		System.out.printf("%d %d",
		    1<<size,
		    size-Integer.numberOfTrailingZeros(numSquares));
	}
}
