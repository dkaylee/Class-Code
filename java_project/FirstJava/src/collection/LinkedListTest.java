package collection;

import java.awt.List;
import java.util.ArrayList;
import java.util.LinkedList;

public class LinkedListTest {

	public static void main(String[] args) {
		
		// List<E> : 저장 순서 유지( 반복문이용 용이 ), 중복 저장이 허용
		// 인스턴스 저장을 목적으로 하는 클래스
		// List 인스턴스 생성
		// ArrayList<Integer> list = new ArrayList<Integer>();
		// LinkedList<Integer> list = new LinkedList<Integer>();
		// List<Integer> list = new ArrayList();	
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		
		// 데이터 저장 : 참조값을 저장
		// add(<T>)
		list.add(new Integer(11));
		list.add(new Integer(22));
		list.add(new Integer(33));
		list.add(55);	// Auto Boxing
		list.add(44);	// Auto Boxing
		
		// 리스트는 저장의 순서를 가진다.
		// List의 요소 참조
		// <T> get()
		System.out.println("list의 첫 번째 요소의 값 : "+list.get(0));	// 11
		
		// List 요소의 개수 
		// size() 메서드 개수반환은 0 이상의 숫자만 반환한다.
		System.out.println("list 요소의 개수 : "+list.size());
		
		// 반복문을 이용한 모든 요소 참조
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		// for each 사용법
		System.out.println("-----------------");
		for(Integer i : list) {
			System.out.println(i);
		}
		
		// list 요소의 삭제
		// remove(index 값)
		// 첫번째 요소를 삭제
		System.out.println("-----------------");
		list.remove(2);
		
		for(int i: list) {	// Auto Boxing
			System.out.println(i);
		}
			
			
			
			

	}

}
