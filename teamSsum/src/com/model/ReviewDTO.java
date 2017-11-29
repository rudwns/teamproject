package com.model;

public class ReviewDTO {

	private int num;
	private String nick;
	private String day;
	private String content;
	public ReviewDTO(int num, String nick, String day, String content) {
		super();
		this.num = num;
		this.nick = nick;
		this.day = day;
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public String getNick() {
		return nick;
	}
	public String getDay() {
		return day;
	}
	public String getContent() {
		return content;
	}
	
	
}
