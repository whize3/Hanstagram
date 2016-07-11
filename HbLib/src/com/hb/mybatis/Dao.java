package com.hb.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class Dao {
	SqlSession ss;
	public Dao() {
		ss = DBService.getFactory().openSession(true);
	}
	//리스트생성
	
}
