package phone;

import java.util.Scanner;

public class PhoneInfor {
	
	/*
	 * Version 0.1 전화번호 관리 프로그램.
	 * PhoneInfor 라는 이름의 클래스를 정의해 보자. 
	 * 클래스는 다음의 데이터들의 문자열 형태로 저장이 가능 해야 하며,
	 * 저장된 데이터의 적절한 출력이 가능하도록 메소드 정의
	 * • 이름 name String
	 * • 전화번호 phoneNumber String
	 * • 생년월일 birthday String 
	 * 단, 생년월일 정보는 저장할 수도 있고, 저장 않을 수도 있게끔 생성자 생성.
	 */
	

	Scanner sc = new Scanner(System.in);
	
	//변수지정
	String name;
	String phoneNumber;
	String birthday;
	
	//데이터 받기
	void getData(String name, String phoneNumber, String birthday) {
		name = sc.next();
		phoneNumber = sc.next();
		birthday = sc.next();		
	}
	
	void showData() {
		System.out.println(name+" "+phoneNumber+" "+birthday);
	}
	
	public static void main(String[] args) {
		
		
		PhoneInfor p = new PhoneInfor();
		
		System.out.println("이름과 전화번호를 입력해주세요");
		
		String info = p.getData(sc.next());
		
		p.showData();
		
	}
	
	
	

}
