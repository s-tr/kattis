import java.util.*;
import java.io.*;

/**
 * Kattis problem virtualfriends
 * 
 * Difficulty: 0.0
 * Solved:     2017-12-10
 */

class UnionFind {
    private int[] rank;
    private int[] parent;
    private int[] setSizes;
    private int   count;

    /**
     * Initialises a new disjoint set with size i.
     *
     * @param size the size of the disjoint set.
     */
    public UnionFind(int size){
        if(size<=0){
            throw new IllegalArgumentException(
                "Size of disjoint set must be positive");
        }
        rank=new int[size];
        parent=new int[size];
        setSizes=new int[size];
        
        for(int i=0;i<size;i++){
            parent[i]=i;
        }
        count=size;
        
        Arrays.fill(setSizes,1);
    }

    /**
     * Returns the number of sets.
     *
     * @return the number of sets
     */
    public int count(){
        return count;
    }

    /**
     * Finds the root of a node i, performing path compression.
     *
     * @param i The node to find the root of.
     * @return The root of the tree containing node i.
     */
    private int findRoot(int i){
        if(parent[i]==i) {
            //at the root
            return i;
        } else {
            int root=findRoot(parent[i]);
            //path compression!
            parent[i]=root;
            return root;
        }
    }

    /**
     * Unions the sets containing first and second respectively if they
     * are distinct, and does nothing if they are in the same set.
     *
     * @param first  The first point to merge.
     * @param second The second point to merge.
     * @return True if a merge occurred, false otherwise.
     */
    public boolean union(int first, int second){
        if(first<0 || second<0 || first>parent.length || second>parent.length){
            throw new IllegalArgumentException("Invalid values!");
        }
        int firstRoot = findRoot(first);
        int secondRoot = findRoot(second);

        if(firstRoot == secondRoot){
            return false;
        } else {
            if(rank[firstRoot]>rank[secondRoot]){
                parent[secondRoot]=firstRoot;
                setSizes[firstRoot]+=setSizes[secondRoot];
            } else if(rank[firstRoot]<rank[secondRoot]){
                parent[firstRoot]=secondRoot;
                setSizes[secondRoot]+=setSizes[firstRoot];
            } else {
                parent[firstRoot]=secondRoot;
                setSizes[secondRoot]+=setSizes[firstRoot];
                rank[secondRoot]++;
            }
            count--;
            return true;
        }
    }
    
    /**
     * Finds the size of the set containing n.
     */
    public int componentSize(int n){
		return setSizes[findRoot(n)];
	}
	
	/**
	 * Resets the state of the union-find set to its original
	 * state of all disjoint.
	 */
	public void reset(){
        Arrays.fill(rank,0);
        Arrays.fill(setSizes,1);
        count=rank.length;
		for(int i=0;i<count;i++){
			parent[i]=i;
		}
	}
}

class NamedUnionFind extends UnionFind {
	private Map<String,Integer> map;
	private int nameCount;
	private final int maxSize;
	
	public NamedUnionFind(int n){
		super(n);
		map=new HashMap<>();
		nameCount=0;
		maxSize=n;
	}
	
	public int indexOfName(String s){
		if(map.containsKey(s)){
			return map.get(s);
		} else {
			if(nameCount==maxSize){
				throw new IllegalStateException(
					"Reached max size, unable to add more!");
			} else {
				map.put(s,nameCount);
				nameCount++;
				return nameCount-1;
			}
		}
	}
	
	/**
	 * Merges the two components containing name1 and name2,
	 * and returns the size of the new component.
	 */
	public int merge(String name1, String name2){
		int a1=indexOfName(name1);
		int a2=indexOfName(name2);
		union(a1,a2);
		return componentSize(a1);
	}
	
	@Override
	public void reset(){
		super.reset();
		map.clear();
		nameCount=0;
	}
}



public class VirtualFriends {
	public static void main(String[] args){
		Scanner sc=new Scanner(System.in);
		int nTestCases=sc.nextInt();
		NamedUnionFind onion=new NamedUnionFind(200000);
		for(int i=0;i<nTestCases;i++){
			int nFriendships=sc.nextInt();
			for(int j=0;j<nFriendships;j++){
				System.out.println(onion.merge(sc.next(),sc.next()));
			}
			onion.reset();
		}
	}
}
