package com.hb.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class Dao {
	private static SqlSession ss;

	
	public Dao() {
		ss = DBService.getFactory().openSession(true);
	}
	
	public List<BookVO> search(String b_num, String booklist){
		Map<String, String> map = new HashMap<>();
		map.put("b_num", b_num);
		map.put("booklist",booklist);
		List<BookVO> list = ss.selectList(booklist,map);
		return list;
	}
	


}

	//리스트생성
	

