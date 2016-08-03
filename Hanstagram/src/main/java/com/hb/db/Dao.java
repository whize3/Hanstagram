package com.hb.db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class Dao {
	private static SqlSessionFactory sessionFactory;

	public SqlSessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SqlSessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	//¿¹½Ã
	
	/*public List<BbsVO> getList(){
		SqlSession ss = null;
		List<BbsVO> list = null;
		try {
			ss = sessionFactory.openSession();
			list = ss.selectList("list");
		} catch (Exception e) {
			ss.close();
		}finally{
			ss.close();
		}
		return list;
	}*/

}
