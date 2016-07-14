package com.hb.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class Dao {
	SqlSession ss;
	public Dao() {
		ss = DBService.getFactory().openSession(true);
	}
	// 도서 자료구입요청 받은 데이터 BOOKAPPLY에 삽입
	
	public void bookApply(Book_ApplyVO bavo){
		ss.insert("apply", bavo);
	}
	
	
}
