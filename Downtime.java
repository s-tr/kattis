import java.util.*;
import java.io.*;

/**
 * Kattis problem downtime
 * 
 * Difficulty: 4.0
 * Solved:     2017-11-24
 */
public class Downtime {
	public static void main(String[] args) throws Exception {
		Scanner sc=new Scanner(System.in);
		int nRequests=sc.nextInt();
		int slotsPerServer=sc.nextInt();
		int nSlots = slotsPerServer;
		PriorityQueue<Event> q=new PriorityQueue<>(nRequests+10,new EventComparator());
		Set<Integer> free=new HashSet<>(nSlots*2);
		for(int i=0;i<nSlots;i++){
			free.add(i);
		}
		for(int i=0;i<nRequests;i++){
			int startTime = sc.nextInt();
			q.add(Event.start(startTime, startTime+1000));
		}
		while(!q.isEmpty()){
			Event e=q.poll();
			switch(e.type){
				case Event.START: {
					if(!free.isEmpty()){
						int slot=free.iterator().next();
						q.add(Event.end(e.end,slot));
						free.remove(slot);
						//System.out.printf("added in slot %d\n",slot);
					} else {
						q.add(Event.end(e.end,nSlots));
						nSlots++;
						//System.out.printf("increased to %d slots\n",nSlots);
					}
				}
				break;
				case Event.END: {
					free.add(e.slot);
				}
				break;
			}
		}
		System.out.print(nSlots/slotsPerServer+(nSlots%slotsPerServer==0?0:1));
	}
	
	public static class Event {
		final int time;
		final int type;
		final int slot;
		final int end;
		
		static final int START = 1;
		static final int END   = 0;
		
		private Event(int time, int type, int slot, int end){
			this.time=time;
			this.type=type;
			this.end=end;
			this.slot=slot;
		}
		
		static Event start(int time, int end){
			return new Event(time,START,-1,end);
		}
		
		static Event end(int time, int slot){
			return new Event(time,END,slot,-1);
		}
	}
	
	public static class EventComparator implements Comparator<Event> {
		public int compare(Event a, Event b){
			int r1 = Integer.compare(a.time,b.time);
			if(r1==0){
				return Integer.compare(a.type,b.type);
			} else {
				return r1;
			}
		}
	}
}
