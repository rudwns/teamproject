package com.model;

public class FileVO {
	
	private int num;
	private String writer;
	private String you;
	private String fileName;
	private String day;
	
	public FileVO(int num, String writer, String you, String fileName, String day) {
		super();
		this.num = num;
		this.writer = writer;
		this.you = you;
		this.fileName = fileName;
		this.day = day;
	}

	public int getNum() {
		return num;
	}

	public String getWriter() {
		return writer;
	}

	public String getYou() {
		return you;
	}

	public String getFileName() {
		return fileName;
	}

	public String getDay() {
		return day;
	}
	
	
	

}
