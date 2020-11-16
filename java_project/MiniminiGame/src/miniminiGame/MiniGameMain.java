package miniminiGame;

import java.util.InputMismatchException;
import java.io.IOException;

public class MiniGameMain implements Util, Menu {

	public static void main(String[] args) throws IOException {
		
		while(true) {
			System.out.println("--------------MINIMINI GAME--------------");
			System.out.println("|"+Menu.GAMES +". 게임하기\t\t\t\t|"); 
			System.out.println("|"+Menu.MYPAGE+". 마이페이지\t\t\t\t|"); 
			System.out.println("|"+Menu.STORE+". 상점  \t\t\t\t|"); 
			System.out.println("|"+Menu.RANKING+". 랭킹보기\t\t\t\t|");
			System.out.println("|"+Menu.EXIT+". 종료하기\t\t\t\t|"); 
			System.out.println("-----------------------------------------");
		break;
		}
		
		int choice = 0;
		
		try {
			
			choice = SC.nextInt();
			
			if(!(choice > 0 && choice < 5)) {
				BadInputException e = new BadInputException(String.valueOf(choice));
				throw e;
			}
		} catch (InputMismatchException | BadInputException e) {
			System.out.println("잘 못 입력했습니다. 다시 시도 해주세요.");
			SC.nextLine();
			continue;
		} catch (Exception e1) {
			System.out.println("메뉴를 잘못 입력했습니다. 다시 시도 해주세요.");
			SC.nextLine();
			continue;
	}
		SC.nextLine();
		
		switch(choice) {
		case Menu.GAMES:
			
			break;
		case Menu.MYPAGE:
			System.out.println("1.무슨 게임1");
			System.out.println("2.무슨 게임2");
			System.out.println("3.무슨 게임3");
			SC.nextLine();
			
			break;
		case Menu.STORE:
			break;
		case Menu.RANKING:
			break;
		case Menu.EXIT:
			System.out.println("게임을 종료합니다.");
			break;
			
			
		}
		
		
	}

}
