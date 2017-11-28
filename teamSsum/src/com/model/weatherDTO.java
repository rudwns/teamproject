package com.model;

public class weatherDTO {
	String day;
	String weather;
	String min_temp;
	String max_temp;

	public weatherDTO(String day, String weather, String min_temp, String max_temp) {
		super();
		this.day = day;
		this.weather = weather;
		this.min_temp = min_temp;
		this.max_temp = max_temp;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
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
