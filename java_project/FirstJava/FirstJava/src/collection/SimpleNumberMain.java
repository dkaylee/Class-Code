package collection;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class SimpleNumberMain {

	public static void main(String[] args) {
		
		
		// Set 인스턴스 생성
		// 중복저장되지 않도록 처리하는 방법
		Set<SimpleNumber> set = new HashSet<SimpleNumber>();
		
		set.add(new SimpleNumber(10));
		set.add(new SimpleNumber(20));
		set.add(new SimpleNumber(10));
		
		
		System.out.println("Set 요소의 개수: " + set.size());
		
		// set의 반복에 필요함
		Iterator<SimpleNumber> itr = set.iterator();
		
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
		

	}

}
