package com.model;

public class ShowDTO {

	private String title;
	private String place;
	private String days;
	private String link;
	
	public ShowDTO(String title, String place, String days, String link) {
		super();
		this.title = title;
		this.place = place;
		this.days = days;
		this.link = link;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	
	
	
}
