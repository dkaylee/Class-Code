package card;

public class Card {
	
	String kind; //카드의 종류
	int number;  //카드의 숫자
	
	Card(String kind, String number){
		this.kind = kind;
		this.number = number;
		
	}
	
	//클래스 변수 선언
	static int width = 100;  // 카드의 폭
	static int height = 250; // 카드의 높이
	
	static void play( ) {
		System.out.println("카드놀이를 합니다.");
	}

}
