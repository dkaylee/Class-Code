package phone.copy;

import java.util.Scanner;

import phone.PhoneInfor;

public class PhoneMain {

	static Scanner sc = new Scanner(System.in);
	
	PhoneInfor p = new PhoneInfor(null, null, null);

	// 입력받기
	public static PhoneInfor input() {
		System.out.println("=====정보입력=====");
		
		System.out.println("이름을 입력해주세요 : ");
		String name = sc.nextLine();
		
		System.out.println("전화번호를 입력해주세요 : ");
		String phoneNumber = sc.nextLine();
		
		System.out.println("생년월일을 입력해주세요 : ");
		String birthday = sc.nextLine();
		
		return new PhoneInfor(name, phoneNumber, birthday);
	}

	// 출력하기
	public static void main(String args[]) {
		PhoneInfor p;

		while (true) {
			System.out.println("1:입력 \n2:종료");
			int input = sc.nextInt();
			sc.nextLine();
			if (input == 1)
				p = input();
			else
				break;
			p.showData();
		}

	}
}