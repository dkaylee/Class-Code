package phoneBookVer04;

import java.util.Scanner;

public class PhoneBookMain {

	public static void main(String[] args) {

		// PhoneBookManager 인스턴스 생성 : 배열과 메서드 사용
		PhoneBookManager manager = new PhoneBookManager();
		System.out.println("현재 저장된 정보의 개수 : " + manager.cnt);
		System.out.println("저장이 가능한 정보의 총 개수 : " + manager.phoneBook.length);

		// Scanner sc = new Scanner(System.in);

		while (true) {

			System.out.println("전화번호 관리 프로그램 ============");
			System.out.println("메뉴를 입력하세요");
			System.out.println(" 0.일반 연락처 정보 저장");
			System.out.println(" 1.학교 친구 연락처 정보 저장");
			System.out.println(" 2.회사 친구 연락처 정보 저장 ");
			System.out.println(" 3.동호회 연락처 정보 저장 ");
			System.out.println(" 4.연락처 검색 ");
			System.out.println(" 5.연락처 삭제");
			System.out.println(" 6.전체보기");
			System.out.println(" 7.프로그램종료");
			System.out.println("===========================");

			char choice = Util.sc.nextLine().charAt(0);

			switch (choice) {
				
			case '0': case '1': case '2': case'3':
				manager.insertMember(choice);
				break;
			case '4':
				manager.searchMember();
				break;
			case '5':
				manager.deleteMember();
				break;
			case '6':
				manager.displayAll();
				break;
			case '7':
				System.out.println("프로그램을 종료합니다.");
				System.exit(0);
				break;
			}

		}

	}

}
