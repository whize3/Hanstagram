package spring.project.db;

public class CommentVO {
String c_idx, id, c_content, c_time, b_idx;
public CommentVO() {

}


public CommentVO(String c_idx, String id, String c_content, String c_time, String b_idx) {
	super();
	this.c_idx = c_idx;
	this.id = id;
	this.c_content = c_content;
	this.c_time = c_time;
	this.b_idx = b_idx;
}


public String getC_idx() {
	return c_idx;
}

public void setC_idx(String c_idx) {
	this.c_idx = c_idx;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id = id;
}

public String getC_content() {
	return c_content;
}

public void setC_content(String c_content) {
	this.c_content = c_content;
}

public String getC_time() {
	return c_time;
}

public void setC_time(String c_time) {
	this.c_time = c_time;
}

public String getB_idx() {
	return b_idx;
}

public void setB_idx(String b_idx) {
	this.b_idx = b_idx;
}

}
