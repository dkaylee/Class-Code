package pBookTest;

public class PBookInfor {
	
	private String name;
	private String phoneNum;
	private String addr;
	private String email;
	
	
private PBookInfor(String name, String phoneNum, String addr, String email) {
		
		this.name = name;
		this.phoneNum = phoneNum;
		this.addr = addr;
		this.email = email;
	}


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
		phoneNum = phoneNum;
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
	
	public void allInfor() {
		
	}
	
	

}
