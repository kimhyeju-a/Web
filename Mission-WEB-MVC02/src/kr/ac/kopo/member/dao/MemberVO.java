package kr.ac.kopo.member.dao;

public class MemberVO {
	private String id;
	private String password;
	private String type;
	private String name;
	
	public MemberVO() {
	}
	
	public MemberVO(String id, String password) {
		this.id = id;
		this.password = password;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", type=" + type + ", name=" + name + "]";
	}
	
}
