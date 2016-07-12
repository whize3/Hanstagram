package com.hb.mybatis;

public class YulVO {
	private String y_num, y_location, y_state;
	public YulVO(String y_num, String y_location, String y_state) {
		super();
		this.y_num = y_num;
		this.y_location = y_location;
		this.y_state = y_state;
	}
	public String getY_num() {
		return y_num;
	}
	public void setY_num(String y_num) {
		this.y_num = y_num;
	}
	public String getY_location() {
		return y_location;
	}
	public void setY_location(String y_location) {
		this.y_location = y_location;
	}
	public String getY_state() {
		return y_state;
	}
	public void setY_state(String y_state) {
		this.y_state = y_state;
	}
	public YulVO() {
		// TODO Auto-generated constructor stub
	}
}
