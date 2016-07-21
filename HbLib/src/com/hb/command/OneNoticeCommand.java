package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.NoticeVO;

public class OneNoticeCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String n_idx = request.getParameter("n_idx");
		Dao dao = new Dao();
		
		NoticeVO notice = dao.getOneNotice(n_idx); // 글 하나 가져오기
		
		int hit = Integer.parseInt(notice.getN_hit())+1;
		notice.setN_hit(String.valueOf(hit));
		dao.noticeHit(notice); // 히트 수 업데이트
		
		request.setAttribute("notice", notice);
		request.setAttribute("cPage", request.getParameter("cPage"));
		return "board/onenotice.jsp";
	}

}
