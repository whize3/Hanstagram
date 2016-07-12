package com.hb.mybatis;

public class NoticeVO {
	private String n_idx, n_subject, n_content, n_hit, n_date;
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}
	public NoticeVO(String n_idx, String n_subject, String n_content, String n_hit, String n_date) {
		super();
		this.n_idx = n_idx;
		this.n_subject = n_subject;
		this.n_content = n_content;
		this.n_hit = n_hit;
		this.n_date = n_date;
	}

	public String getN_idx() {
		return n_idx;
	}

	public void setN_idx(String n_idx) {
		this.n_idx = n_idx;
	}

	public String getN_subject() {
		return n_subject;
	}

	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_hit() {
		return n_hit;
	}

	public void setN_hit(String n_hit) {
		this.n_hit = n_hit;
	}

	public String getN_date() {
		return n_date;
	}

	public void setN_date(String n_date) {
		this.n_date = n_date;
	}
}
