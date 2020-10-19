package phoneBookVer04;

public class PhoneUnivInfor extends PhoneInfor {
	
	private String major;	//전공
	private String year;	//학년
	
	PhoneUnivInfor(String name, String phoneNumber, String addr, String email, String major, String year){
		super(name, phoneNumber, addr, email);
		this.major = major;
		this.year = year;
	}
	

	@Override
	void showInfor() {
		
		System.out.println("학교연락처정보------------");
		super.showInfor();
		System.out.println("전공 : "+major);
		System.out.println("학년 : "+year);
	}

}