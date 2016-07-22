package com.hb.mybatis;

public class Q_CommentVO {
	private String qc_idx, q_idx, id, qc_content,qc_date;
	public Q_CommentVO() {
		
	}
	


	public Q_CommentVO(String qc_idx, String q_idx, String id, String qc_content, String qc_date) {
		super();
		this.qc_idx = qc_idx;
		this.q_idx = q_idx;
		this.id = id;
		this.qc_content = qc_content;
		this.qc_date = qc_date;
	}



	public String getQc_date() {
		return qc_date;
	}


	public void setQc_date(String qc_date) {
		this.qc_date = qc_date;
	}
	public String getQc_idx() {
		return qc_idx;
	}

	public void setQc_idx(String qc_idx) {
		this.qc_idx = qc_idx;
	}

	public String getQ_idx() {
		return q_idx;
	}

	public void setQ_idx(String q_idx) {
		this.q_idx = q_idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQc_content() {
		return qc_content;
	}

	public void setQc_content(String qc_content) {
		this.qc_content = qc_content;
	}
}
