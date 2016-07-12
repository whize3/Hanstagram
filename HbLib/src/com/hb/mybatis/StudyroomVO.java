package com.hb.mybatis;

public class StudyroomVO {
	private String s_num, s_location;
	public StudyroomVO() {
		// TODO Auto-generated constructor stub
	}

	public StudyroomVO(String s_num, String s_location) {
		super();
		this.s_num = s_num;
		this.s_location = s_location;
	}

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

	public String getS_location() {
		return s_location;
	}

	public void setS_location(String s_location) {
		this.s_location = s_location;
	}
}
