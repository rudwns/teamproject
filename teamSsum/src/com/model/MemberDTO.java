package com.model;

public class MemberDTO {
	private String id;
	private String pw;
	private String nick;
	private String email;
	private String tel;
	
	public MemberDTO(String id, String pw, String nick) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}
	public MemberDTO(String id, String nick, String email, String tel) {
		this.id = id;
		this.nick = nick;
		this.email = email;
		this.tel = tel;
	}	
	public MemberDTO(String id, String pw, String nick, String email, String tel) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.email = email;
		this.tel = tel;
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

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
