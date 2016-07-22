package com.hb.mybatis;

public class B_CommentVO {
private String bc_idx, b_num, id, bc_content, bc_date;
public B_CommentVO(){}
public B_CommentVO(String bc_idx, String b_num, String id, String bc_content, String bc_date) {
	super();
	this.bc_idx = bc_idx;
	this.b_num = b_num;
	this.id = id;
	this.bc_content = bc_content;
	this.bc_date = bc_date;
}
public String getBc_idx() {
	return bc_idx;
}
public void setBc_idx(String bc_idx) {
	this.bc_idx = bc_idx;
}
public String getB_num() {
	return b_num;
}
public void setB_num(String b_num) {
	this.b_num = b_num;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getBc_content() {
	return bc_content;
}
public void setBc_content(String bc_content) {
	this.bc_content = bc_content;
}
public String getBc_date() {
	return bc_date;
}
public void setBc_date(String bc_date) {
	this.bc_date = bc_date;
}



}
