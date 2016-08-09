package spring.project.db;

public class BoardVO {
	String b_idx, id, b_time, img_url, b_content, like_state,like_count;
public BoardVO() {
	
}

public BoardVO(String b_idx, String id, String b_time, String img_url, String b_content, String like_state,
		String like_count) {
	super();
	this.b_idx = b_idx;
	this.id = id;
	this.b_time = b_time;
	this.img_url = img_url;
	this.b_content = b_content;
	this.like_state = like_state;
	this.like_count = like_count;
}

public String getLike_count() {
	return like_count;
}
public void setLike_count(String like_count) {
	this.like_count = like_count;
}
public String getLike_state() {
	return like_state;
}
public void setLike_state(String like_state) {
	this.like_state = like_state;
}
public String getB_idx() {
	return b_idx;
}
public void setB_idx(String b_idx) {
	this.b_idx = b_idx;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getB_time() {
	return b_time;
}
public void setB_time(String b_time) {
	this.b_time = b_time;
}
public String getImg_url() {
	return img_url;
}
public void setImg_url(String img_url) {
	this.img_url = img_url;
}
public String getB_content() {
	return b_content;
}
public void setB_content(String b_content) {
	this.b_content = b_content;
}



}
