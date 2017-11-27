package com.model;

public class BookDTO {
	private String num;
	private String title;
	private String author;
	private String publisher;
	private String possible;

	public BookDTO(String num, String title, String author, String publisher) {
		this.num = num;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
	}

	public String getNum() {
		return num;
	}

	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public String getPublisher() {
		return publisher;
	}

	public String getPossible() {
		return possible;
	}
	
	
	
}
