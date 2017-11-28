package com.model;

public class MovieDTO {
	
	private String title;
	private String image;
	
	public MovieDTO(String title, String image) {
		super();
		this.title = title;
		this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	

	
	
	
}
