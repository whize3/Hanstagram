package com.hb.mybatis;

import java.sql.SQLException;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.session.SqlSession;

public class StudyroomDAO {
	private static SqlSession ss;
	
	public StudyroomDAO() {
		ss = DBService.getFactory().openSession(true);
	}
	
	public List<StudyroomVO> allStudyRoom(){
		List<StudyroomVO> list = ss.selectList("getRoom");
		return list;
	}
	
	public List<StudyroomVO> getTime(String date){
		System.out.println("getTime");
		List<StudyroomVO> list = ss.selectList("getTime",date);
		System.out.println("list.size="+list.size());
		return list;
	}
	
	public void roomReserve(Studyroom_ReserveVO rvo){
		System.out.println("roomReserve"+rvo.getS_num());
		try{
			ss.insert("reserve", rvo);
			ss.commit();
		}catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			
		}
	}
}
