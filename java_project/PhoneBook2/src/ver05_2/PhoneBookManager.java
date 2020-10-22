package ver05_2;

import phoneBookVer03.Util;

public class PhoneBookManager {
	
	/*
	 * Project ver 0.50 PhoneBookManager 클래스의 인스턴스수가 최대 하나를 넘지 않도록 코드를 변경.
	 * ‘interface’기반의 상수 표현을 바탕으로 메뉴 선택과 그에 따른 처리가, 이름에 부여된 상수를 기반으로 진행되도록 변경. 
	 * 현재의 기본 크래스를 interface와 추상클래스를 사용하는 구조로 변경해 봅시다. 
	 * interface : 필수 메서드 정의  *추상클래스 : 인스턴스 변수와 interface를 상속 받지만 구현하지 않은 클래스
	 */
	
	private PhoneInfor[] pBook;	// 전화번호 정보를 저장할 배열
	private int cnt;			// 배열에 저장된 요소 개수
	
	private PhoneBookManger(int size) {
		pBook = new PhoneInfor[size];
		cnt = 0;
	}
	
	// 사용할 인스턴스 수 하나 클래스 내부에 설정하기
	private static PhoneBookManager manager = new PhoneBookManager();
	
	// 외부의 참조값을 사용하기 위함
	public static PhoneBookManager getInstance() {
		return manager;
	}
	
	// 배열에 정보 저장을 위한 메서드
	private void addInfor(PhoneInfor info) {
		pBook[cnt++] = info;
	}
	
	// 전화번호 배열에 저장
	public void insertInfor() {
		
		if(pBook.length == cnt) {
			System.out.println("저장할 수 있는 공간이 없습니다. 일부정보를 삭제해주세요.");
		}
		
		System.out.println("입력할 정보를 선택해주세요!");
		System.out.println(Menu.UNIV + ". 대학");
		System.out.println(Menu.COM + ". 회사");
		System.out.println(Menu.CAFE + ". 동호회");
		
		int choice = Util.sc.nextInt();
		
		Util.sc.nextLine();
		
		if(!(choice > 0 && choice < 4)) {
			System.out.println("잘못 선택하셨습니다.\n 처음으로 이동합니다.");
			return;
		}
		
		System.out.println("정보를 입력해 주세요");
		System.out.println("이름 : ");
		String name = Util.sc.nextLine();
		System.out.println("전화번호 : ");
		String phoneNum = Util.sc.nextLine();
		System.out.println("주소 : ");
		String addr = Util.sc.nextLine();
		System.out.println("이메일 : ");
		String email = Util.sc.nextLine();
		
		switch(choice) {
		
		// 학교친구정보 받기
		case Menu.UNIV :
			System.out.println("전공 >> ");
			String major = Util.sc.nextLine();
			System.out.println("학년 >> ");
			int grade = Util.sc.nextInt();
			
			addInfor(new UnivPhoneInfor(name, phoneNum, addr, email, grade, major));
			
		
		}
		
	}
	
	
	
	
	

}
