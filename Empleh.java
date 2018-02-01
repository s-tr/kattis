import java.util.*;
import java.io.*;

/**
 * Kattis problem empleh
 * 
 * Difficulty: 2.2
 * Solved:     2018-01-17
 */

public class Empleh {
	static String b="+---+---+---+---+---+---+---+---+\n"+
	"|...|:::|...|:::|...|:::|...|:::|\n"+
	"+---+---+---+---+---+---+---+---+\n"+
	"|:::|...|:::|...|:::|...|:::|...|\n"+
	"+---+---+---+---+---+---+---+---+\n"+
	"|...|:::|...|:::|...|:::|...|:::|\n"+
	"+---+---+---+---+---+---+---+---+\n"+
	"|:::|...|:::|...|:::|...|:::|...|\n"+
	"+---+---+---+---+---+---+---+---+\n"+
	"|...|:::|...|:::|...|:::|...|:::|\n"+
	"+---+---+---+---+---+---+---+---+\n"+
	"|:::|...|:::|...|:::|...|:::|...|\n"+
	"+---+---+---+---+---+---+---+---+\n"+
	"|...|:::|...|:::|...|:::|...|:::|\n"+
	"+---+---+---+---+---+---+---+---+\n"+
	"|:::|...|:::|...|:::|...|:::|...|\n"+
	"+---+---+---+---+---+---+---+---+";
	static char[][] board;
	static {
		String[] ls = b.split("\n");
		board = new char[17][];
		for(int i=0;i<17;i++){
			board[i]=ls[i].toCharArray();
		}
	}
	public static void main(String[] args){
		Scanner sc=new Scanner(System.in);
		String[] white=sc.nextLine().substring(7).split(",");
		String[] black=sc.nextLine().substring(7).split(",");
		for(String piece:white){
			if(piece.length()==3){
				char pieceName=piece.charAt(0);
				int column=piece.charAt(1)-'a';
				int row=piece.charAt(2)-'1';
				board[15-2*row][4*column+2]=pieceName;
			} else  if(piece.length()==2){
				int column=piece.charAt(0)-'a';
				int row=piece.charAt(1)-'1';
				board[15-2*row][4*column+2]='P';
			}
		}
		for(String piece:black){
			if(piece.length()==3){
				char pieceName=piece.charAt(0);
				int column=piece.charAt(1)-'a';
				int row=piece.charAt(2)-'1';
				board[15-2*row][4*column+2]=Character.toLowerCase(pieceName);
			} else if(piece.length()==2) {
				int column=piece.charAt(0)-'a';
				int row=piece.charAt(1)-'1';
				board[15-2*row][4*column+2]='p';
			}
		}
		for(int i=0;i<17;i++){
			System.out.println(new String(board[i]));
		}
	}
}
