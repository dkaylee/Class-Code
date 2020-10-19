package phoneBookVer04;

public class PhoneInfor {
		
		//1.클래스 정의 (변수정의, 메서드정의, 생성자 정의)
		//전화번호 관리 프로그램
		//변수설정
		private String name;		// 이름
		private String phoneNumber;	// 전화번호
		private String addr;		// 주소
		private String email;		// 이메일

		//생성자 : 세개의 데이터를 받아 초기화
		PhoneInfor(String name, String phoneNumber, String addr, String email){
			this.name = name;
			this.phoneNumber = phoneNumber;
			this.addr = addr;
			this.email = email;
		}
		
		//
		public String getName() {
			return name;
		}
		
		public String getPhoneNumber() {
			return phoneNumber;
		}
		
		public String getAddr() {
			return addr;
		}
		
		public String getEmail() {
			return email;
		}
		
		
		//저장된 데이터의 출력 메서드
		void showInfor() {
			System.out.println("이름: " + name);
			System.out.println("전화번호: " + phoneNumber);
			System.out.println("주소: " + addr);
			System.out.println("이메일: " + email);
			
		}
}
