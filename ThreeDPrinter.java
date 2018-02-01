import java.util.*;
import java.io.*;

/**
 * Kattis problem 3dprinter
 * 
 * Difficulty: 2.0
 * Solved:     2017-12-10
 */

public class ThreeDPrinter {
	public static void main(String[] args){
		int nStatues = new Scanner(System.in).nextInt();
		System.out.println(1+(32-Integer.numberOfLeadingZeros(nStatues-1)));
	}
}
