import java.util.*;
import java.io.*;

/**
 * Kattis problem addingwords
 * 
 * Difficulty: 4.3
 * Solved:     2017-11-24
 */

public class AddingWords {
	public static void main(String[] args){
		Scanner sc=new Scanner(System.in);
		Map<String,Integer> map   = new HashMap<>();
		Map<Integer,String> unmap = new HashMap<>();
		while(sc.hasNextLine()){
			String line=sc.nextLine();
			StringTokenizer stok=new StringTokenizer(line);
			switch(stok.nextToken()){
				case "calc":  {
					System.out.print(line.substring(5));
					System.out.print(" ");
					try{
						int result;
						result=map.get(stok.nextToken());
						loop:
						while(true){
							switch(stok.nextToken()){
								case "+": {
									result+=map.get(stok.nextToken());
								} break;
								case "-": {
									result-=map.get(stok.nextToken());
								} break;
								case "=": {
									String res=unmap.get(result);
									if(res==null){
										System.out.println("unknown");
									} else {
										System.out.println(res);
									}
									break loop;
								}
							}
						}
					} catch(Exception e){
						System.out.println("unknown");
					}
				} break;
				case "def":   {
					String name = stok.nextToken();
					int value = Integer.parseInt(stok.nextToken());
					if(map.containsKey(name)){
						int oldValue = map.get(name);
						map.remove(name);
						unmap.remove(oldValue);
					}
					map.put(name,value);
					unmap.put(value,name);
				} break;
				case "clear": {
					map.clear();
					unmap.clear();
				} break;
			}
		}
	}
}
