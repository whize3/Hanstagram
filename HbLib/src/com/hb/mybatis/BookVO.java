package com.hb.mybatis;

public class BookVO {
	private String b_num, b_subject, b_location, publisher, writer, category, ISBN;
	public BookVO() {
		// TODO Auto-generated constructor stub
	}

	public BookVO(String b_num, String b_subject, String b_location, String publisher, String writer, String category,
			String iSBN) {
		super();
		this.b_num = b_num;
		this.b_subject = b_subject;
		this.b_location = b_location;
		this.publisher = publisher;
		this.writer = writer;
		this.category = category;
		ISBN = iSBN;
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

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
}
