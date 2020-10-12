package phone;

import java.util.Scanner;

public class PMain {
	
	PhoneInfor contact = new PhoneInfor(null, null, null);
	
	static PhoneInfor input() {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("======전화번호 프로그램======");
		System.out.println("이름을 입력해주세요 >> ");
		String name = sc.nextLine();
		System.out.println("전화번호를 입력해주세요 >> ");
		String phoneNumber = sc.nextLine();
		System.out.println("생년월일을 입력해주세요 >> ");
		String birthday = sc.nextLine();
		
		return new PhoneInfor(name,phoneNumber,birthday);
	}
	

	public static PhoneInfor main(String[] args, String[] showData) {
		
		while (true) {
			System.out.println("1.입력 \n 2.종료");
			int input = sc.nextlnt();
			if(input == 1) {
				System.out.println(showData);
			}
		}
		
		
		
		
	}
	
	

}
