import java.util.*;
import java.io.*;

/**
 * Kattis problem suffixarrayreconstruction
 * 
 * Difficulty: 4.9
 * Solved:     2017-12-02
 */

public class SuffixArray {
	private char[] array;
	private boolean possibility;
	
	public SuffixArray(int length){
		array=new char[length];
		possibility=true;
	}
	
	private void mergeChar(int index, char c){
		if(possibility == false){
			// it is impossible already
			return;
		} else if(array[index] == 0){
			// there was nothing here
			array[index] = c;
		} else if(array[index] != c){
			// a mismatch!
			possibility = false;
		} //otherwise array[index] already is c, and we are done
	}
	
	public void mergeSuffix(int index, String suffix){
		if(possibility == false){
			return;
		}
		else {
			index--;
			char[] chars = suffix.toCharArray();
			for(int i=0; i<chars.length; i++){
				if(chars[i]=='*'){
					break;
				} else {
					mergeChar(index+i,chars[i]);
				}
			}
			for(int i=1; i<=chars.length; i++){
				if(chars[chars.length-i]=='*'){
					break;
				} else {
					mergeChar(array.length-i,chars[chars.length-i]);
				}
			}
		}
	}
	
	public String toString(){
		if(possibility == false){
			return "IMPOSSIBLE";
		}
		StringBuilder sb=new StringBuilder();
		for(int i=0;i<array.length;i++){
			char c=array[i];
			if(c==0){
				return "IMPOSSIBLE";
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}
	
	public static void main(String[] args){
		Scanner sc=new Scanner(System.in);
		int rounds = sc.nextInt();
		for(int i=0;i<rounds;i++){
			int length = sc.nextInt();
			int nSuffixes = sc.nextInt();
			SuffixArray sa = new SuffixArray(length);
			for(int j=0;j<nSuffixes;j++){
				sa.mergeSuffix(sc.nextInt(),sc.next());
			}
			System.out.println(sa);
		}
	}
}
