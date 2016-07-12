package com.hb.mybatis;

public class QNAVO {
	private String q_idx, q_subject,id, q_content, q_hit, q_date;
	public QNAVO() {
		// TODO Auto-generated constructor stub
	}

	public QNAVO(String q_idx, String q_subject, String id, String q_content, String q_hit, String q_date) {
		super();
		this.q_idx = q_idx;
		this.q_subject = q_subject;
		this.id = id;
		this.q_content = q_content;
		this.q_hit = q_hit;
		this.q_date = q_date;
	}

	public String getQ_idx() {
		return q_idx;
	}

	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}

	public String getQ_subject() {
		return q_subject;
	}

	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_hit() {
		return q_hit;
	}

	public void setQ_hit(String q_hit) {
		this.q_hit = q_hit;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	} 
}
