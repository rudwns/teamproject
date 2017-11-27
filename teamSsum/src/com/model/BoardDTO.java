package com.model;

public class BoardDTO {
	private int num;
	private String title;
	private String nick;
	private String content;
	private String day;
	private int hit;
	
	public BoardDTO(int num, String title, String nick, String content,String day, int hit) {
		this.num = num;
		this.title = title;
		this.nick = nick;
		this.content = content;
		this.day = day;
		this.hit = hit;
	}
	
	public int getNum() {
		return num;
	}
	public String getTitle() {
		return title;
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
	public int getHit() {
		return hit;
	}
	
	
}
