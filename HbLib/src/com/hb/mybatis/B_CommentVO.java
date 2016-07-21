package com.hb.mybatis;

public class B_CommentVO {
private String b_num,bc_idx, bc_content, ISBN, id;
public B_CommentVO(String b_num, String bc_idx, String bc_content, String iSBN, String id) {
	super();
	this.b_num = b_num;
	this.bc_idx = bc_idx;
	this.bc_content = bc_content;
	ISBN = iSBN;
	this.id = id;
}

public String getB_num() {
	return b_num;
}

public void setB_num(String b_num) {
	this.b_num = b_num;
}

public String getISBN() {
	return ISBN;
}
public void setISBN(String iSBN) {
	ISBN = iSBN;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public B_CommentVO() {

}
public String getBc_idx() {
	return bc_idx;
}
public void setBc_idx(String bc_idx) {
	this.bc_idx = bc_idx;
}
public String getBc_content() {
	return bc_content;
}
public void setBc_content(String bc_content) {
	this.bc_content = bc_content;
}


}
