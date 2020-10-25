package ver05;

public class UnivPhoneInfor extends PhoneInfor {
	
	// 대학친구 : 전공, 학년
	private String major;	// 전공
	private int grade;		// 학년
	
	// 생성자 : 상위클래스의 생성자 호출, 추가된 변수의 초기화
	public UnivPhoneInfor(String name, String phoneNum, String addr, String email,String major, int grade) {
		
		// 생성자 : 상위클래스의 생성자 호출, 추가된 변수의 초기화
		super(name, phoneNum, addr, email);
		
		// 새로 추가된 멤버 변수 초기화
		this.major = major;
		this.grade = grade;
	}
	
	

	public String getMajor() {
		return major;
	}



	public void setMajor(String major) {
		this.major = major;
	}



	public int getGrade() {
		return grade;
	}



	public void setGrade(int grade) {
		this.grade = grade;
	}



	@Override
	public void showInfor() {
		// TODO Auto-generated method stub
		super.showInfor();
		System.out.println("전공 : " + major);
		System.out.println("gkr");
	}



	@Override
	public void showBasicInfor() {
		super.showInfor();
		// TODO Auto-generated method stub
		
	}

	

}
