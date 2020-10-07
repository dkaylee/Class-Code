package card;

public class CardMain {
	
	static int weight = 5;
	
	public static void main(String[] args) {
		
		System.out.println(Math.PI);
		
		System.out.println("가로폭사이즈: "+CardMain.weight);
		
		Card.play();
		
		System.out.println("카드의 폭사이즈: "+Card.width);
		
		Card c1 = new Card();
		Card c2 = new Card();
		
		System.out.println("====================");
		System.out.println("카드 1의 정보");
		System.out.println("모양: "+c1.kind+", 숫자는"+c.number);
		
		
		
		c1.play();
		
		System.out.println("카드의 폭 사이즈: "+c1.width);
		System.out.println("카드의 폭 사이즈: "+c2.width);
		
		Card.width = 120;
		System.out.println("카드의 폭 사이즈 변경 "+Card.width);
		
	}

}
