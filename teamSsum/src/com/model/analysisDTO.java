package com.model;

public class analysisDTO {

	String id;
	String i_aff; // ���� ȣ����
	String you_aff; // ����� ȣ����
	String i_resp; // ���� ��մ���ð�
	String you_resp; // ����� ��մ���ð�
	public analysisDTO(String id, String i_aff, String you_aff, String i_resp, String you_resp) {
		super();
		this.id = id;
		this.i_aff = i_aff;
		this.you_aff = you_aff;
		this.i_resp = i_resp;
		this.you_resp = you_resp;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getI_aff() {
		return i_aff;
	}
	public void setI_aff(String i_aff) {
		this.i_aff = i_aff;
	}
	public String getYou_aff() {
		return you_aff;
	}
	public void setYou_aff(String you_aff) {
		this.you_aff = you_aff;
	}
	public String getI_resp() {
		return i_resp;
	}
	public void setI_resp(String i_resp) {
		this.i_resp = i_resp;
	}
	public String getYou_resp() {
		return you_resp;
	}
	public void setYou_resp(String you_resp) {
		this.you_resp = you_resp;
	}

	

}
