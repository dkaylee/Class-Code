package phone;

import java.util.Scanner;

public class PhoneMain {

	public static void main(String[] args) {
		
		PhoneInfor p = new PhoneInfor(null, null, null);
		
				
		//연락처 배열 저장
		PhoneInfor [] list = new PhoneInfor[100];
		int count = 0;
		Scanner sc = new Scanner(System.in);
		
		final int INS = 0;
		final int DEL = 1;
		final int EXIT = 2;
		
		while(true) {
			System.out.println("========전화번호========");
			System.out.println("0 = 연락처추가 / 1 = 연락처삭제 / 2 = 나가기 ");
			int answer = sc.nextInt ();
		switch(answer) {
		case 0:
			INS:
				getData();
		break;
		case 1:
			DEL:
				delet();
		break;
		case 2:
			EXIT:
				exit();
			break;
		default:
			System.out.println("잘못입력하셨습니다. 0 = 연락처추가 / 1 = 연락처삭제 / 2 = 나가기 입력하세요. ");
			return;
		}
		}
		
		
	}

	public static PhoneInfor getData() {
		
			Scanner sc = new Scanner(System.in);
		
			System.out.println("정보를 입력해주세요!");
			
			System.out.println("이름을 입력하세요: ");
			String name = sc.nextLine();
			
			System.out.println("전화번호를 입력하세요: ");
			String phoneNumber = sc.nextLine();
			
			System.out.println("생년월일을 입력하세요: ");
			String birthday = sc.nextLine();
			
			return new PhoneInfor(name,phoneNumber,birthday);
		
	}
	
	
	
	public static void delet() {
		
		  int index;
		  System.out.print("삭제할 이름 입력:");
		  String name = keyboard.nextLine();
		  index = PhoneInfor.list(name);
		  
		  if(index<0)
		   System.out.println("해당하는 값이 없습니다.");
		  else{
		   for(int i=index;i<count-1;i++){
		    phoneBook[i]=phoneBook[i+1];    
		   }
		   count--;
		   System.out.println("데이터삭제 완료\n");
		  }
		  String birthday = sc.nextLine();
	
}
	
	

}
