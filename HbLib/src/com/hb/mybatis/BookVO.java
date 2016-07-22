package com.hb.mybatis;

public class BookVO {
	private String b_num, b_subject, b_location, publisher, writer, category, isbn, s_url, l_url, b_state, b_date;
	public BookVO() {
		// TODO Auto-generated constructor stub
	}
	public BookVO(String b_num, String b_subject, String b_location, String publisher, String writer, String category,
			String isbn, String s_url, String l_url, String b_state, String b_date) {
		super();
		this.b_num = b_num;
		this.b_subject = b_subject;
		this.b_location = b_location;
		this.publisher = publisher;
		this.writer = writer;
		this.category = category;
		this.isbn = isbn;
		this.s_url = s_url;
		this.l_url = l_url;
		this.b_state = b_state;
		this.b_date = b_date;
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
	public String getB_location() {
		return b_location;
	}
	public void setB_location(String b_location) {
		this.b_location = b_location;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getS_url() {
		return s_url;
	}
	public void setS_url(String s_url) {
		this.s_url = s_url;
	}
	public String getL_url() {
		return l_url;
	}
	public void setL_url(String l_url) {
		this.l_url = l_url;
	}
	public String getB_state() {
		return b_state;
	}
	public void setB_state(String b_state) {
		this.b_state = b_state;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	

}
