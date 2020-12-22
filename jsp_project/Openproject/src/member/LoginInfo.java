package member;

public class LoginInfo {

	private String memberId;
	private String memberName;
	private String memberPhoto;
	
	// 생성자
	public LoginInfo(String memberId, String memberName, String memberPhoto) {
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPhoto = memberPhoto;
	}

	public String getMemberId() {
		return memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getMemberPhoto() {
		return memberPhoto;
	}
	
	
	

	@Override
	public String toString() {
		return "LoginInfo [memberId=" + memberId + ", memberName=" + memberName + ", memberPhoto=" + memberPhoto + "]";
	}
	
	
	
}
