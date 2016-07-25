package com.hb.mybatis;

public class Book_ApplyVO {
private String ba_idx, ba_state, ba_date, id, b_subject, publisher, writer, category, isbn, s_url, l_url,refuse_reason, r_num;




public Book_ApplyVO(String ba_idx, String ba_state, String ba_date, String id, String b_subject, String publisher,
		String writer, String category, String isbn, String s_url, String l_url, String refuse_reason, String r_num) {
	super();
	this.ba_idx = ba_idx;
	this.ba_state = ba_state;
	this.ba_date = ba_date;
	this.id = id;
	this.b_subject = b_subject;
	this.publisher = publisher;
	this.writer = writer;
	this.category = category;
	this.isbn = isbn;
	this.s_url = s_url;
	this.l_url = l_url;
	this.refuse_reason = refuse_reason;
	this.r_num = r_num;
}

public String getIsbn() {
	return isbn;
}

public void setIsbn(String isbn) {
	this.isbn = isbn;
}

public String getRefuse_reason() {
	return refuse_reason;
}

public void setRefuse_reason(String refuse_reason) {
	this.refuse_reason = refuse_reason;
}

public String getBa_idx() {
	return ba_idx;
}
public void setBa_idx(String ba_idx) {
	this.ba_idx = ba_idx;
}
public String getBa_state() {
	return ba_state;
}
public void setBa_state(String ba_state) {
	this.ba_state = ba_state;
}
public String getBa_date() {
	return ba_date;
}

public void setBa_date(String ba_date) {
	this.ba_date = ba_date;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
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


public String getR_num() {
	return r_num;
}

public void setR_num(String r_num) {
	this.r_num = r_num;
}

public Book_ApplyVO() {
	// TODO Auto-generated constructor stub
}




}
