package com.model;

public class RestoDTO {
	String title;
	String mood;
	String address;
	String phone;
	String we;
	public RestoDTO(String title, String mood, String address, String phone, String we) {
		super();
		this.title = title;
		this.mood = mood;
		this.address = address;
		this.phone = phone;
		this.we = we;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMood() {
		return mood;
	}
	public void setMood(String mood) {
		this.mood = mood;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWe() {
		return we;
	}
	public void setWe(String we) {
		this.we = we;
	}
	
	
}
