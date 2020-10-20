package ver04;

public class PhoneBookMain {

	public static void main(String[] args) {
		
		PhoneBookManager manager = new PhoneBookManager(100);
		
		while(true) {
			System.out.println("메뉴를 입력해주세요.=============");
			System.out.println("1. 저장");
			System.out.println("2. 검색");
			System.out.println("3. 삭제");
			System.out.println("4. 모든정보출력");
			System.out.println("5. EXIT");
			
			System.out.println("\n>> ");
			
			int select = Util.sc.nextInt();
			
			if(!(select>0 && select<6)) {
				System.out.println("메뉴의 선택이 옳바르지 않습니다. \n 다시 선택해주세요.");
				continue;
			}
			
			switch(select) {
			case 1:
				manager.intsertInfo();
				break;
			case 2:
				break;
			case 3:
				break;
			case 4:
				break;
			case 5:
				System.out.println("프로그램을 종료합니다.");
				return;
			}
			
		}

	}

}
