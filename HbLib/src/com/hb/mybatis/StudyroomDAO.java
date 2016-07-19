package com.hb.mybatis;

import java.sql.SQLException;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSession;

public class StudyroomDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql(){
		if(ss==null){
			ss = DBService.getFactory().openSession();
		}
		return ss;
	}
	public StudyroomDAO() {
		
	}
	
	public List<StudyroomVO> allStudyRoom(){
		List<StudyroomVO> list = getSql().selectList("getRoom");
		return list;
	}
	
	public List<StudyroomVO> getTime(String date){
		System.out.println("getTime");
		List<StudyroomVO> list = getSql().selectList("getTime",date);
		System.out.println("list.size="+list.size());
		return list;
	}
	
	public void roomReserve(Studyroom_ReserveVO rvo){
		System.out.println("roomReserve"+rvo.getS_num());
		try{
			getSql().insert("reserve", rvo);
			getSql().commit();
		}catch(Exception e){
			e.printStackTrace();
			getSql().rollback();
			
		}
	}
}
