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

	// 도서 자료구입요청 받은 데이터 BOOKAPPLY에 삽입
	public void bookApply(Book_ApplyVO bavo){
		ss.insert("apply", bavo);
	}
	
	// 로그인
	public UsersVO login(String id, String pwd){
		UsersVO user = new UsersVO();
		user.setId(id);
		user.setPwd(pwd);
		UsersVO result = ss.selectOne("login", user);
		return result;
	}

	
	public List<BookVO> search(String booksearch, String keyword , String desearch) {
		Map<String, String> map = new HashMap<>();
		map.put("booksearch", booksearch);
		map.put("keyword",keyword);
		map.put("desearch", desearch);
		List<BookVO> list = ss.selectList("booklist",map);
		return list;
	}
	public List<MyDrawVO> getMyDraw(String id){
		List<MyDrawVO> list = ss.selectList("getmydraw",id);
		ss.close();
		return list;
	}
	public List<MyDrawVO> getMyReserve(String id){
		List<MyDrawVO> list = ss.selectList("getmyreserve",id);
		MyDrawVO myDrawVO = new MyDrawVO();
		String result=null;
		for(MyDrawVO k : list){
			result = ss.selectOne("getmyreserve_cnt",k.getB_num());
			if(result.equals("0")){
				k.setBd_date("반납도서");
			}else{
				myDrawVO = ss.selectOne("getmyreserve_chk",k.getB_num());
				k.setBd_date(myDrawVO.getBd_date().substring(0,10));
			}
		}
		ss.close();
		return list;
	}
	public List<MyDrawVO> getMyHistory(String id){
		List<MyDrawVO> list = ss.selectList("getmyhistory",id);
		ss.close();
		return list;
	}
	public List<MyDrawVO> getMyComment(String id){
		List<MyDrawVO> list = ss.selectList("getmycomment",id);
		return list;
	}
	public UsersVO getMyInfo(String id){
		UsersVO list = ss.selectOne("getmyinfo",id);
		ss.close();
		return list;
	}
	public String getMyCommentCnt(String id){
		String bc_cnt = ss.selectOne("getmycommentcnt",id);
		ss.close();
		return bc_cnt;
	}
	public void getMyInfoUpdate(Map<String,String> map){
		ss.update("getmyinfoupdate",map);
		ss.close();
	}
	
	public String getJoinCheckId(String id){
		  String result = "사용가능";
		  List<UsersVO> list = ss.selectList("getjoincheckid",id);
		  if(list.size()>0){
			  result = "중복된 아이디";
		  }
		  ss.close();
		  return result;
		}
	public void UsersJoin(UsersVO usersVO){
		try {
			ss.insert("usersjoin",usersVO);
			ss.close();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			
		}
		
	}
	


}

	//리스트생성

	

