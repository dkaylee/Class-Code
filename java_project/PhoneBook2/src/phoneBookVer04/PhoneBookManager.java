package phoneBookVer04;

import java.util.Scanner;

public class PhoneBookManager {

	// 배열 
	PhoneInfor[] phoneBook; // 정보 저장을 위한 배열 선언
	int cnt; 				// 저장된 정보의 개수


	// 초기화
	public PhoneBookManager() {
		//배열의 저장공간을 100개 생성
		this(100);
	}

	PhoneBookManager(int size) {
		phoneBook = new PhoneInfor[size++];
		// sc = new Scanner(System.in);
	}

	

	// 저장 기능
	void insertMember(int choice) {

		System.out.println("번호 정보를 입력을 시작합니다.");

		// 이름 입력 받기
		System.out.println("이름을 입력해주세요 : ");
		String name = Util.sc.nextLine();

		// 전화번호 받기
		System.out.println("전화번호를 입력해주세요 : ");
		String phoneNumber = Util.sc.nextLine();

		// 주소 받기
		System.out.println("주소를 입력해주세요 : ");
		String addr = Util.sc.nextLine().trim();
		
		// 이메일 받기
		System.out.println("이메일을 입력해주세요 : ");
		String email = Util.sc.nextLine().trim();
		
		// 배열에 저장하기 위한 인스턴스 참조변수 선언
		PhoneInfor infor = null;
		
		// 인스턴스를 생성해서 저장
		
		if(choice == '0') {
			//일반
			infor = new PhoneInfor(name, phoneNumber, addr, email);
			
		}else if(choice == '1') {
			// 전공 받기
			System.out.println("전공을 입력해주세요 : ");
			String major = Util.sc.nextLine().trim();
			
			// 학년 받기
			System.out.println("학년을 입력해주세요 : ");
			String year = Util.sc.nextLine().trim();
			
			// 배열에 저장
			infor = new PhoneUnivInfor(name, phoneNumber, addr, email, major, year);
			
		}else if(choice == '2') {
			
			// 회사 받기
			System.out.println("회사를 입력해주세요 : ");
			String company = Util.sc.nextLine().trim();
			infor = new PhoneComInfor(name, phoneNumber, addr, email, company);
			
		}else if(choice == '3') {
			// 가족 받기
			System.out.println("동호회를 입력해주세요 : ");
			String family = Util.sc.nextLine().trim();	
			//배열에 저장
			infor = new PhoneFamilyInfor(name, phoneNumber, addr, email, family);
		}
		
		phoneBook[cnt++] = infor;
		
		System.out.println("입력완료!");
		
		


	}

	// 정보 검색
	void searchMember() {

		if (cnt == 0) {
			System.out.println("저장된 데이터가 없습니다. 다시 메뉴로 이동합니다.");
			return;
		}

		// 찾고자하는 이름을 받는다.
		System.out.println("정보검색을 시작합니다.");
		System.out.println("찾고자하는 이름을 입력하세요 : ");
		String name = Util.sc.nextLine();

		// 이름을 요소 index 검색
		int index = searchIndex(name);

		if (index < 0) {
			System.out.println("찾으시는 이름의 정보가 존재하지 않습니다.");
		} else {
			// 정보 출력
			phoneBook[index].showInfor();
		}
	}

	// 이름 문자열을 받아서,
	// 배열의 정보와 비교하고,
	// index를 찾아서 반환하는 메서드
	int searchIndex(String name) {
		int result = -1;

		// 검색 : index를 찾는다.
		for (int i = 0; i < cnt; i++) {
			if (phoneBook[i].getName().equals(name)) {
				result = i;
				break;
			}
		}

		return result;
	}

	// 정보 삭제
	void deleteMember() {

		if (cnt == 0) {
			System.out.println("등록된 정보가 없습니다.");
			return;
		}

		System.out.println("정보 삭제를 진행합니다.");
		System.out.println("삭제 하고자 하는 정보의 이름을 입력해주세요");
		String name = Util.sc.nextLine();

		// 이름을 요소 index 검색
		int index = searchIndex(name);


		if (index < 0) {
			System.out.println("삭제 하고자 하는 정보가 존재하지 않습니다.");
		} else {

			for (int i = index; i < cnt - 1; i++) {
				phoneBook[i] = phoneBook[i + 1];
			}
			cnt--;

			System.out.println("정보를 삭제 했습니다.");
		}
	}
	

	// 전체 정보 출력
	public void displayAll() {
		
		if (cnt == 0) {
			System.out.println("등록된 정보가 없습니다.");
			return;
		}
		System.out.println("전체 정보를 출력합니다.(" + cnt + ")");
		System.out.println("----------------");
		for (int i = 0; i < cnt; i++) {
			phoneBook[i].showInfor();
			System.out.println("--------------------");
		}

	}

}
