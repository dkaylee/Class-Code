package ver06;

import java.util.InputMismatchException;

public class PhoneBookMain implements Util {

	public static void main(String[] args) throws BadInputException {
		
		PhoneBookManager manager = PhoneBookManager.getInstance();
		
		while(true) {
			System.out.println("*********메뉴를 입력해주세요*********");
			System.out.println(Menu.INSERT+". 저장");
			System.out.println(Menu.SEARCH+". 검색");
			System.out.println(Menu.DELETE+". 삭제");
			System.out.println(Menu.DISPLAY_ALL+". 모든정보출력");
			System.out.println(Menu.EXIT+". EXIT");
			
			System.out.println("********************************");
			
			int select = 0;
			
			try {
			
			select = SC.nextInt();
			
			if(!(select>0 && select<6)) {
				//System.out.println("메뉴의 선택이 옳바르지 않습니다. \n다시 선택해주세요.");
				//Exception e = new Exception("잘못된 메뉴입력입니다.");
				BadInputException e = new BadInputException(String.valueOf(select));
				throw e;
				}
			} catch (InputMismatchException | BadInputException e) {
				System.out.println("메뉴입력이 잘못되었습니다.");
				SC.nextLine();
				continue;
			} catch (Exception e1) {
				System.out.println("메뉴입력이 잘못되었습니다.");
				SC.nextLine();
				continue;
			}
			
			
				switch(select) {
				case Menu.INSERT:
					manager.insertInfor();
					break;
				case Menu.SEARCH:
					manager.searchInfor();
					break;
				case Menu.DELETE:
					manager.deleteInfor();
					break;
				case Menu.DISPLAY_ALL:
					manager.showAllInfor();
					break;
				case Menu.EXIT:
					System.out.println("프로그램을 종료합니다.");
					return;
				}
			}
		}
	}
