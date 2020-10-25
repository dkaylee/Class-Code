package ver06;

import java.util.ArrayList;
import java.util.Collection;

import ver06.Util;

public class PhoneBookManager {
	
	/*
	 * ver06 ArrayList 사용하기
	 */
	
	// 객체생성하기
	private static PhoneBookManager pBook = new PhoneBookManager();

	// 사용할 인스턴스 수 하나 클래스 내부에 설정하기
	private ArrayList<String> manager = new ArrayList<String>(100);
	
	
	// 외부의 참조값을 사용하기 위함
	public PhoneBookManager getInstance() {
		return pBook;
	}
	
	
	// 전화번호 배열에 저장
	public void insertInfor() {
		
		if(manager.size() == 0) {
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
			String grade = Util.sc.nextLine();
			
			manager.add(new UnivPhoneInfor(name, phoneNum, addr, email, grade, major));
			
			break;
			
		// 회사정보 받기	
		case Menu.COM :
			System.out.println("회사 이름 >> ");
			String company = Util.sc.nextLine();
			manager.add(company);
			
			break;
			
		// 동호회 정보 받기	
		case Menu.CAFE :
			System.out.println("동호회 이름 >> ");
			String cafeName = Util.sc.nextLine();
			manager.add(cafeName);
			System.out.println("닉네임 >> ");
			String nickName = Util.sc.nextLine();
			manager.add(nickName);
			
			
			break;
		}
		
		System.out.println("입력하신 정보가 저장되었습니다. 저장수 ( "+ manager.size() +" )");
	}
	
	
	public void searchInfor() {
		Util.sc.nextLine();
		
		String input = null;
		System.out.println("찾으실 이름을 입력해주세요");
		input = Util.sc.nextLine();
		
		 if (manager.equals(input)) {
			 System.out.println(manager);
		 }else {
			 System.out.println("검색한 이름"+input+"이 존재하지 않습니다.");
		 }
		
	}
	
	public void deleteInfor() {
		Util.sc.nextLine();
		
		String input = null;
		System.out.println("찾으실 이름을 입력해주세요");
		input = Util.sc.nextLine();
		
		
		for(int i=0; i<manager.size();i++) {
			if(manager.get(i).name.equals(input)) {
			manager.remove(i);
			System.out.println("정보 삭제 완료!");
		}
	}
	
	public void showAllInfor() {
		if(manager.size()==0) {
			System.out.println("입력된 정보가 없습니다.");
			return;
		}
		
		System.out.println("*********전체정보를 출력합니다*********");
		for(int i=0; i<manager.size(); i++) {
			System.out.println(manager.get(i));
		}
		System.out.println("*********************************");
	}
	
}
	
	
	
	
