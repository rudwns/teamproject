package com.model;

public class giftDTO {

	String title;
	String img;
	String link;

	public giftDTO(String title, String img, String link) {
		super();
		this.title = title;
		this.img = img;
		this.link = link;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
