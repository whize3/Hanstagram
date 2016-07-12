package com.hb.mybatis;

public class UsersVO {
	private String id, name, pwd, jumin, email, tel, addr;
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

	public UsersVO(String id, String name, String pwd, String jumin, String email, String tel, String addr) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.jumin = jumin;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
	}
	
}
