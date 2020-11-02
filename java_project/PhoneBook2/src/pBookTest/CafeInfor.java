package pBookTest;

public class CafeInfor extends PBookInfor{
	

	private String cafeName;
	private String nickName;

	// 생성자 : 상위클래스의 생성자 호출, 추가된 변수의 초기화
	public CafeInfor(String name, String phoneNum, String addr, String email, String cafeName, String nickName) {
		super(name, phoneNum, addr, email);
		this.cafeName = cafeName;
		this.nickName = nickName;
	}

	public String getCafeName() {
		return cafeName;
	}

	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public void showInfor() {
		super.showInfor();
		System.out.println("동호회 이름 : " + cafeName);
		System.out.println("닉네임 : " + nickName);
		
		
	}

}
