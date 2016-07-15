package com.hb.mybatis;

public class MyDrawVO {
	private String bd_date,isbn,writer,b_subject,id,b_num,bd_redate,bc_idx,bc_date;
	
	public MyDrawVO(){}

	public MyDrawVO(String bd_date, String isbn, String writer, String b_subject, String id, String b_num,
			String bd_redate, String bc_idx, String bc_date) {
		super();
		this.bd_date = bd_date;
		this.isbn = isbn;
		this.writer = writer;
		this.b_subject = b_subject;
		this.id = id;
		this.b_num = b_num;
		this.bd_redate = bd_redate;
		this.bc_idx = bc_idx;
		this.bc_date = bc_date;
	}

	public String getBd_date() {
		return bd_date;
	}

	public void setBd_date(String bd_date) {
		this.bd_date = bd_date;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getB_subject() {
		return b_subject;
	}

	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getB_num() {
		return b_num;
	}

	public void setB_num(String b_num) {
		this.b_num = b_num;
	}

	public String getBd_redate() {
		return bd_redate;
	}

	public void setBd_redate(String bd_redate) {
		this.bd_redate = bd_redate;
	}

	public String getBc_idx() {
		return bc_idx;
	}

	public void setBc_idx(String bc_idx) {
		this.bc_idx = bc_idx;
	}

	public String getBc_date() {
		return bc_date;
	}

	public void setBc_date(String bc_date) {
		this.bc_date = bc_date;
	}
	
}
