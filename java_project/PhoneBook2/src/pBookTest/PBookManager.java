package pBookTest;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class PBookManager implements Menu{
	
	private List<PBookInfor> plist;

	// 사용 할 수 인스턴스 생성하기 
	private PBookManager(int num) {
		plist = new ArrayList<PBookInfor>();
	}
	
	// 내부에 인스턴스 생성하기
	private static PBookManager manager = new PBookManager(100);
	
	// 외부에서 참조 변수 받기
	public static PBookManager getInstance() {
		return manager;
	}
	
	// 전화번호 저장 메서드
	public void addInfor(PBookInfor infor) {
		plist.add(infor);
	}
	
	
	// 전화번호 배열에 저장
	public void insertInfor() {
		
		Scanner sc = new Scanner(System.in);
		
		int choice = 0;
		
		while(true) {
			System.out.println("입력할 정보를 선택해주세요");
			System.out.println(Menu.UNIV+"대학친구");
			System.out.println(Menu.COMP+"회사동료");
			System.out.println(Menu.CAFE+"동아리");
			
			try {
			choice = sc.nextInt();
			
			if(!(choice>=0 && choice<=4)) {
				System.out.println("잘 못 입력했습니다.");
			}

			} catch{
				
			}
		}
		
		
		
	}
	
	

}
