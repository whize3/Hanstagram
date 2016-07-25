package com.hb.mybatis;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	
	public List<Studyroom_ReserveVO> getTime(Map<Object, Object> map){
		List<Studyroom_ReserveVO> list = ss.selectList("getTime",map);
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
	public List<Studyroom_ReserveVO> getReserveList(){
		List<Studyroom_ReserveVO> list = ss.selectList("reserveList");
		return list;
	}
	public void updateTime(){
		
		try {
			ss.update("srUpdateAuto");
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
		}
	}
	
	public void updateState(String sr_idx){

		try {
			ss.update("srUpdate",sr_idx);
			ss.commit();
			ss.close();
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
		}
	}
	public Studyroom_ReserveVO getResult(Studyroom_ReserveVO rvo){
		Studyroom_ReserveVO vo = ss.selectOne("getResult", rvo); 
		return vo;
	}

}
