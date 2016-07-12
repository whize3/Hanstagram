package com.hb.mybatis;

public class Book_ApplyVO {
private String ba_idx, ba_state, ISBN, ba_date, id;
public Book_ApplyVO() {
	// TODO Auto-generated constructor stub
}

public Book_ApplyVO(String ba_idx, String ba_state, String iSBN, String ba_date, String id) {
	super();
	this.ba_idx = ba_idx;
	this.ba_state = ba_state;
	ISBN = iSBN;
	this.ba_date = ba_date;
	this.id = id;
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

public String getISBN() {
	return ISBN;
}

public void setISBN(String iSBN) {
	ISBN = iSBN;
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

}
