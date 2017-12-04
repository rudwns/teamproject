package com.model;

public class gift_listDTO {
	String id;
	String word_rank1;
	String word_rank2;
	String word_rank3;
	String word_rank4;
	String word_rank5;

	public gift_listDTO(String id, String word_rank1, String word_rank2, String word_rank3, String word_rank4,
			String word_rank5) {
		super();
		this.id = id;
		this.word_rank1 = word_rank1;
		this.word_rank2 = word_rank2;
		this.word_rank3 = word_rank3;
		this.word_rank4 = word_rank4;
		this.word_rank5 = word_rank5;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWord_rank1() {
		return word_rank1;
	}

	public void setWord_rank1(String word_rank1) {
		this.word_rank1 = word_rank1;
	}

	public String getWord_rank2() {
		return word_rank2;
	}

	public void setWord_rank2(String word_rank2) {
		this.word_rank2 = word_rank2;
	}

	public String getWord_rank3() {
		return word_rank3;
	}

	public void setWord_rank3(String word_rank3) {
		this.word_rank3 = word_rank3;
	}

	public String getWord_rank4() {
		return word_rank4;
	}

	public void setWord_rank4(String word_rank4) {
		this.word_rank4 = word_rank4;
	}

	public String getWord_rank5() {
		return word_rank5;
	}

	public void setWord_rank5(String word_rank5) {
		this.word_rank5 = word_rank5;
	}

}
