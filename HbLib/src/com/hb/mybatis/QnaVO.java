package com.hb.mybatis;

public class QnaVO {
	private String q_idx, qa_subject, id, qa_content, qa_hit, qa_date, r_num;
	
	

	public QnaVO(String q_idx, String qa_subject, String id, String qa_content, String qa_hit, String qa_date,
			String r_num) {
		super();
		this.q_idx = q_idx;
		this.qa_subject = qa_subject;
		this.id = id;
		this.qa_content = qa_content;
		this.qa_hit = qa_hit;
		this.qa_date = qa_date;
		this.r_num = r_num;
	}

	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	public QnaVO() {
		// 
	}

	public String getQ_idx() {
		return q_idx;
	}

	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}

	public String getQa_subject() {
		return qa_subject;
	}

	public void setQa_subject(String qa_subject) {
		this.qa_subject = qa_subject;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_hit() {
		return qa_hit;
	}

	public void setQa_hit(String qa_hit) {
		this.qa_hit = qa_hit;
	}

	public String getQa_date() {
		return qa_date;
	}

	public void setQa_date(String qa_date) {
		this.qa_date = qa_date;
	}
	
}
