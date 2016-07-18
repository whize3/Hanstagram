package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.NoticeVO;
import com.hb.mybatis.Paging;

public class NoticeListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Paging pvo = new Paging();
		Dao dao = new Dao();
		
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		
		// 전체 게시물
		pvo.setTotalRecord(dao.noticeTotalCount());
		pvo.setTotalPage();
		
		// begin 과 end 구하기
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		System.out.println(pvo.getBegin()+"&"+pvo.getEnd());
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		// 원글 리스트 구하기
		List<NoticeVO> list = dao.getNoticeList(map);
		System.out.println("dd");
		request.setAttribute("noticeList", list);
		
		// 블록의 시작번호 끝번호 구하기
		pvo.setBeginPage(((int)(pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
		
		if(pvo.getEndPage()>pvo.getTotalPage()){
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("cPage", cPage);
		
		return "menu3_board_Notice.jsp";
	}

}
