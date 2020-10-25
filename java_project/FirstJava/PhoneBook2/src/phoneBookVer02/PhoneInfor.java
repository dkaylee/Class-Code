package phoneBookVer02;

public class PhoneInfor {
	// 변수 -> 이름, 전화번호, 생년월일 -> 배열 묶음 (전화번호정보 : 새로운타입 정의)
	// class 새로운타입 -> 서로다른 타입의 변수를 묶어서 하나로 사용 -> 변수와 메서드로
	// showInfo() 출력
	// 생성자 -> 초기화메서드 -> 오버로딩 (데이터를 여러개받을 수 있다.)

	// 1.클래스 정의 (변수정의, 메서드정의, 생성자 정의)

	// 전화번호 관리 프로그램

	// 변수설정
	String name; 		// 친구의 이름
	String phoneNumber; // 전화번호
	String birthday; 	// 생일

	// 생성자 : 세개의 데이터를 받아 초기화
	PhoneInfor(String name, String phoneNumber, String birthday) {
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.birthday = birthday;
	}

	// 생성자 : 두개 데이터(이름, 전화번호)
	PhoneInfor(String name, String phoneNumber) {
		// this.name = name;
		// this.phoneNumber = phoneNumber;
		// this(name, phoneNumber, "생일정보없음");
		this(name, phoneNumber, null);
	}

	// 저장된 데이터의 적절한 출력 메서드
	void showInfor() {
		System.out.println("이름: " + name);
		System.out.println("전화번호: " + phoneNumber);

		if (birthday == null) {
			System.out.println("생일: 입력 데이터 없음");
		} else {
			System.out.println("생일: " + birthday);
		}

	}
}
