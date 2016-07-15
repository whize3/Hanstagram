package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.AdminVO;
import com.hb.mybatis.Dao;
import com.hb.mybatis.Paging;
import com.hb.mybatis.UsersVO;

public class MemberListCommand implements Command{

	/*@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		List<UsersVO> list = dao.getMemberList();
		request.setAttribute("memberlist", list);
		return "menu1_memberList.jsp";
	}*/
	
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Paging pvo = new Paging();
		Dao dao = new Dao();
		
		// list 무조건 cPage 부터 받기
		// cPage는 현재 페이지롤 변경, null 이면 현재페이지가 기본값 1이된다.
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		// 전체 게시물의 수
		pvo.setTotalRecord(dao.memberTotalCount());
		pvo.setTotalPage();
		
		//  begin과 end 구하기
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		// 원글 리스트 구하기.
		List<UsersVO> list =  dao.getMemberList(map);
		request.setAttribute("memberlist", list);
		
		//  블록의 시작번호 끝번호 구하기
		pvo.setBeginPage((int)((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
		 
		if(pvo.getEndPage() > pvo.getTotalPage()){
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		// list.jsp에서 페이징 처리할때 필요하므로
		request.setAttribute("pvo", pvo);
	    request.setAttribute("cPage", cPage);
		
		return "menu1_memberList.jsp";
	}
}
