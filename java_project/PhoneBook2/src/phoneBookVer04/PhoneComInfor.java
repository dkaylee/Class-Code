package phoneBookVer04;

public class PhoneComInfor extends PhoneInfor{
	private String company;
	
	PhoneComInfor(String name, String phoneNumber, String addr, String email, String company){
		super(name, phoneNumber, addr, email);
		this.company = company;
	}

	@Override
	void showInfor() {
		System.out.println("회사연락처정보------------");
		super.showInfor();
		System.out.println("회사 : "+company);
	}
	
	
}
