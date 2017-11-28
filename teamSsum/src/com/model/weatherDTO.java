package com.model;

public class weatherDTO {
	String day;
	String min_temp;
	String max_temp;
	
	public weatherDTO(String day, String min_temp, String max_temp) {
		super();
		this.day = day;
		this.min_temp = min_temp;
		this.max_temp = max_temp;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getMin_temp() {
		return min_temp;
	}

	public void setMin_temp(String min_temp) {
		this.min_temp = min_temp;
	}

	public String getMax_temp() {
		return max_temp;
	}

	public void setMax_temp(String max_temp) {
		this.max_temp = max_temp;
	}
}
