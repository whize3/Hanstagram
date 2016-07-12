package com.hb.mybatis;

public class Book_DrawVO {
	private String bd_idx, b_state, bd_date, id;
	public Book_DrawVO() {
		// TODO Auto-generated constructor stub
	}

	public Book_DrawVO(String bd_idx, String b_state, String bd_date, String id) {
		super();
		this.bd_idx = bd_idx;
		this.b_state = b_state;
		this.bd_date = bd_date;
		this.id = id;
	}

	public String getBd_idx() {
		return bd_idx;
	}

	public void setBd_idx(String bd_idx) {
		this.bd_idx = bd_idx;
	}

	public String getB_state() {
		return b_state;
	}

	public void setB_state(String b_state) {
		this.b_state = b_state;
	}

	public String getBd_date() {
		return bd_date;
	}

	public void setBd_date(String bd_date) {
		this.bd_date = bd_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
