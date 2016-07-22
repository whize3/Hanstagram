package com.hb.mybatis;

public class BookDraw_memberVO {
	String bd_date,b_state,b_num,b_subject,publisher,isbn;

	public BookDraw_memberVO(String bd_date, String b_state, String b_num, String b_subject, String publisher,
			String isbn) {
		super();
		this.bd_date = bd_date;
		this.b_state = b_state;
		this.b_num = b_num;
		this.b_subject = b_subject;
		this.publisher = publisher;
		this.isbn = isbn;
	}
	public BookDraw_memberVO() {
		// TODO Auto-generated constructor stub
	}
	public String getBd_date() {
		return bd_date;
	}

	public void setBd_date(String bd_date) {
		this.bd_date = bd_date;
	}

	public String getB_state() {
		return b_state;
	}

	public void setB_state(String b_state) {
		this.b_state = b_state;
	}

	public String getB_num() {
		return b_num;
	}

	public void setB_num(String b_num) {
		this.b_num = b_num;
	}

	public String getB_subject() {
		return b_subject;
	}

	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
}	
