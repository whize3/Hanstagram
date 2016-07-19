package com.hb.mybatis;

public class UsersVO {
	private String id, name, pwd, jumin, email, tel, addr, draw, reserve, overdue;
	
	public UsersVO(String id, String name, String pwd, String jumin, String email, String tel, String addr, String draw,
			String reserve, String overdue) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.jumin = jumin;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.draw = draw;
		this.reserve = reserve;
		this.overdue = overdue;
	}

	public String getDraw() {
		return draw;
	}

	public void setDraw(String draw) {
		this.draw = draw;
	}

	public String getReserve() {
		return reserve;
	}

	public void setReserve(String reserve) {
		this.reserve = reserve;
	}

	public String getOverdue() {
		return overdue;
	}

	public void setOverdue(String overdue) {
		this.overdue = overdue;
	}

	public UsersVO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getJumin() {
		return jumin;
	}

	public void setJumin(String jumin) {
		this.jumin = jumin;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	
	
}
