package ver06;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;

import ver06.Util;

public class PhoneBookManager implements Util{
	
	/*
	 * ver06 ArrayList 사용하기
	 */

	// 사용할 인스턴스 수 하나 클래스 내부에 설정하기
	List<PhoneInfor> pBook;
	
	
	private PhoneBookManager(int num) {
		pBook = new ArrayList<PhoneInfor>();
	}
	
	// 내부에서 인스턴스 생성
	private static PhoneBookManager manager = new PhoneBookManager(100);
	
	
	// 외부에서 참조변수를 받을 수 있는 메서드
		public static PhoneBookManager getInstance() {
			return manager;
		}
	
	// 배열에 전화번호 정보 저장 메서드
	private void addInfor(PhoneInfor info) {
		//pBook[cnt++] = info;

		//List에 정보 저장
		pBook.add(info);
		}
	
	
	// 전화번호 배열에 저장
	public void insertInfor() {
		
		int select = 0;
		
		// List는 저장공간이 부족하면 저장공간을 확장한다.
		while(true) {
		System.out.println("입력할 정보를 선택해주세요!");
		System.out.println(Menu.UNIV + ". 대학");
		System.out.println(Menu.COM + ". 회사");
		System.out.println(Menu.CAFE + ". 동호회");
		
		try {
			
			select = SC.nextInt();
		
		if( !(select>0 && select<4) ) {
			//System.out.println("메뉴 선택이 옳바르지 않습니다.");
			//System.out.println("초기메뉴로 이동합니다. ");
			//return;
			BadInputException e = new BadInputException(String.valueOf(select));
			throw e;
			}
		} catch (InputMismatchException | BadInputException e) {
				System.out.println("잘못된 메뉴입력입니다. 다시 선택해주세요");
				SC.nextLine();
				continue;
			}
		break;
		}
		
		SC.nextLine();
		
		System.out.println("정보를 입력해 주세요");
		System.out.println("이름 : ");
		String name = SC.nextLine();
		System.out.println("전화번호 : ");
		String phoneNum = SC.nextLine();
		System.out.println("주소 : ");
		String addr = SC.nextLine();
		System.out.println("이메일 : ");
		String email = SC.nextLine();
		
		switch(select) {
		
		// 학교친구정보 받기
		case Menu.UNIV :
			System.out.println("전공 >> ");
			String major = SC.nextLine();
			System.out.println("학년 >> ");
			String grade = SC.nextLine();
			
			addInfor(new UnivPhoneInfor(name, phoneNum, addr, email, major, grade));
			
			break;
			
		// 회사정보 받기	
		case Menu.COM :
			System.out.println("회사 이름 >> ");
			String company = SC.nextLine();
			
			addInfor(new CompanyPhoneInfor(name, phoneNum, addr, email, company));
			
			break;
			
		// 동호회 정보 받기	
		case Menu.CAFE :
			System.out.println("동호회 이름 >> ");
			String cafeName = SC.nextLine();
			System.out.println("닉네임 >> ");
			String nickName = SC.nextLine();
			
			addInfor(new CafePhoneInfor(name, phoneNum, addr, email, cafeName, nickName));
			
			
			break;
		}
		
		System.out.println("입력하신 정보가 저장되었습니다. 저장수 ( "+ pBook.size() +" )");
	}
	
	// 리스트의 index 찾기
	private int searchIndex(String name) {
		int index = -1; // 정보가 없을 때
		for(int i=0; i<pBook.size(); i++) {
			//이름으로 비교
			if(pBook.get(i).getName().equals(name)) {
				index = i;
			}
		}
		return index;
	}
	
	
	
	public void searchInfor() {
		
		if(pBook.size()==0) {
			System.out.println("입력된 정보 없음");
			return;
		}
		SC.nextLine();
		System.out.println("검색할 이름 입력해주세요");
		String name = SC.nextLine();
		
		int index = searchIndex(name);
		
		if(index<0) {
			System.out.println("검색한 이름"+name+"의 정보가 없습니다.");
			System.out.println("메뉴로 돌아갑니다");
		} else {
			System.out.println("*********검색결과*********");
			pBook.get(index).showInfor();
		}
	}
		
	
	public void deleteInfor() {
		
		if(pBook.size()==0) {
			System.out.println("삭제할 정보가 없습니다.");
			return;
		}
		
		SC.nextLine();
		
		System.out.println("검색할 이름 입력해주세요");
		String name = SC.nextLine();
		
		int index = searchIndex(name);
		if(index<0) {
			System.out.println("찾으시는 이름 "+name+"의 정보가 존재하지 않습니다.");
			System.out.println("메뉴로 이동합니다.");
		} else {
			// 배열의 요소를 왼쪾으로 시프트 
//			for(int i=index; i<cnt-1; i++) {
//				pBook[i]=pBook[i+1];
//			}
//			cnt--; // 저장된 개수를 감소
			// List 의 요소 삭제는 인덱스의 시프트도 이루어진다.
			pBook.remove(index);
			System.out.println("삭제완료!");
		}

	}
	
	public void showAllInfor() {
		if(pBook.size()==0) {
			System.out.println("입력된 정보가 없습니다.");
			return;
		}
		
		System.out.println("*********전체정보를 출력합니다*********");
		for(int i=0; i<pBook.size(); i++) {
			pBook.get(i).showInfor();
			System.out.println("*********************************");
		}
		
	}
	
}
