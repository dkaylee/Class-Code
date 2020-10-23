package ver05_2;


public class PhoneBookMain {

	public static void main(String[] args) {
		
		PhoneBookManager manager = PhoneBookManager.getInstance();
		
		while(true) {
			System.out.println("---------메뉴를 입력해주세요---------");
			System.out.println(Menu.INSERT+". 저장");
			System.out.println(Menu.SEARCH+". 검색");
			System.out.println(Menu.DELETE+". 삭제");
			System.out.println(Menu.DISPLAY_ALL+". 모든정보출력");
			System.out.println(Menu.EXIT+". EXIT");
			
			System.out.println("-------------------------------");
			
			int select = Util.sc.nextInt();
			
			if(!(select>0 && select<6)) {
				System.out.println("메뉴의 선택이 옳바르지 않습니다. \n다시 선택해주세요.");
				continue;
			}
			
			switch(select) {
			case 1:
				manager.insertInfor();
				break;
			case 2:
				manager.searchInfor();
				break;
			case 3:
				manager.deleteInfor();
				break;
			case 4:
				manager.showAllInfor();
				break;
			case 5:
				System.out.println("프로그램을 종료합니다.");
				return;
			}
			
		}

	}

}