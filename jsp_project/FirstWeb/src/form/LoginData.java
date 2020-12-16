package form;

public class LoginData {
	
	private String id;
	private String pw;

	
	public LoginData() {
		super();
		// TODO Auto-generated constructor stub
	}


	public LoginData(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	@Override
	public String toString() {
		return "LoginData [id=" + id + ", pw=" + pw + "]";
	}

}
