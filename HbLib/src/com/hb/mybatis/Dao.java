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
	
	public List<BookVO> search(String booksearch, String keyword){
		Map<String, String> map = new HashMap<>();
		map.put("booksearch", booksearch);
		map.put("keyword",keyword);
		List<BookVO> list = ss.selectList("booklist",map);
		return list;
	}
	


}

	//리스트생성
	

