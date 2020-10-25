package workSheet2;

public class Playing {
	
	//소유하고 있는 구슬의 정보의 개수
	int kid1 ;
	int kid2 ;
	int numOfCristal;
	
	//놀이를 통한 구슬을 주고받음을 표현한 메서드
	void getData(int k1, int k2) {
		kid1 = k1;
		kid2 = k2;
	}
	
	
	int numOfCrisKid1(int num) {
		
	//얻은 구슬의 개수를 구한다.
		kid1 += num;
		kid2 -= num;
		return num = numOfCristal;
		
	}
	
	void numOfCristalKid2(Playing numOfCrisKid1, int num) {
		
		kid2 += num;
		kid1 -= num;
	}
	
	//구슬치기를 하는 과정에서 구슬을 잃고 얻는 매서드
	
	
	//“1차 게임에서 어린이 1은 어린이 2의 구슬 2개를 획득한다”
	void showResult1() {
		System.out.println("1차 게임 결과 어린이 1은 어린이 2의 구슬"+ numOfCristal +"획득한다");
	}

	//“2차 게임에서 어린이 2는 어린이 1의 구슬 7개를 획득한다.”
	void showResult2() {
		System.out.println("2차 게임 결과 어린이 2은 어린이 1의 구슬"+ numOfCristal +"획득한다");
	}

	//마지막으로 각각의 어린이의 보유 구슬의 개수를 출력하고 프로그램 종료.
	public static void main(String[] args) {
		Playing p = new Playing();
		
		//각각어린이의 구슬보유개수를 설정
		p.getData(15, 9);
		
		//결과 보내기
		p.showResult1();
		p.showResult2();
		
		
	}
	
	
	
	
}
