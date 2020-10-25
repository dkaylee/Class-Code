package ver06;

public class UnivPhoneInfor extends PhoneInfor {
	
	// 대학 친구
	private String major;	// 전공
	private String grade;		// 학년
	
	public UnivPhoneInfor(String name,String phoneNum, String addr,String email, String grade, String major) {
		
		super(name, phoneNum, addr, email);
		this.major = major;
		this.grade = grade;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public void showInfor() {
		super.showInfor();
		System.out.println("전공 : " + major);
		System.out.println("학년 : " + grade);
	}

	@Override
	public void showBasicInfor() {
		super.showInfor();
	}
	
	

}
