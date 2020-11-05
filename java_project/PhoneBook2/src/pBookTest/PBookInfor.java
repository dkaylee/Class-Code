package pBookTest;


public class PBookInfor implements Infor {
	
	
	// 친구의 이름, 전화번호, 주소, 이메일
	// 캡슐화 : 정보은닉 ( 변수의 직접 접근을 제한, 변수를 보호)
	
	private String name;		// 이름
	private String phoneNum;	// 전화번호
	private String addr;		// 주소 
	private String email;		// 이메일
	
	
	public PBookInfor(String name, String phoneNum, String addr, String email) {
		
		this.name = name;
		this.phoneNum = phoneNum;
		this.addr = addr;
		this.email = email;
	}

	// getter setter 메서드를 통해 데이터변경가능
	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhoneNum() {
		return phoneNum;
	}


	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public void showInfor() {
		System.out.println("이름: "+name);
		System.out.println("전화번호: "+phoneNum);
		System.out.println("주소: "+addr);
		System.out.println("이메일: "+email);
	}
	
	public void showBasicInfor() {
		
	}
	
	

}
