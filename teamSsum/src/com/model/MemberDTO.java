package com.model;

public class MemberDTO {
	private String id;
	private String pw;
	private String nick;
	private String personnumber;
	private String sex;
	
	public MemberDTO(String id, String pw, String nick) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}
	public MemberDTO(String id, String nick, String personnumber, String sex) {
		this.id = id;
		this.nick = nick;
		this.personnumber = personnumber;
		this.sex = sex;
	}	
	public MemberDTO(String id, String pw, String nick, String personnumber, String sex) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.personnumber = personnumber;
		this.sex = sex;
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
	public String getPersonnumber() {
		return personnumber;
	}
	public void setPersonnumber(String personnumber) {
		this.personnumber = personnumber;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}

	

	

	
	
}
