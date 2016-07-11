package com.hb.mybatis;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {
	static private SqlSessionFactory factory;
	// static 초기화
	static{
		try {
			// 환경설정파일을 읽기 
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/hb/mybatis/config.xml"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getFactory(){
		return factory;
	}

}
