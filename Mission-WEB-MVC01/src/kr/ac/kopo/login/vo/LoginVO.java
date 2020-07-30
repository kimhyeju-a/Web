package kr.ac.kopo.login.vo;

public class LoginVO {

	private String id;
	private String password;
	private String type;

	public LoginVO() {
		super();
	}

	public LoginVO(String id, String password, String type) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password= " + password + ", type=" + type + "]";

	}
}
