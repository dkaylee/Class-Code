package phoneBookVer04;

public class PhoneFamilyInfor extends PhoneInfor{
	
	private String family;	//동호회
	
	PhoneFamilyInfor(String name, String phoneNumber, String addr, String email,String family){
		super(name, phoneNumber, addr, email);
		this.family = family;	
	}

	@Override
	void showInfor() {
		
		System.out.println("동호회 연락처정보------------");
		System.out.println("동호회 : " + family);
		super.showInfor();
		
		
	}
	

}
