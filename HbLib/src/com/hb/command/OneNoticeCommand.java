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
		dao.noticeHit(n_idx); // 히트 수 업데이트
		NoticeVO notice = dao.getOneNotice(n_idx); // 글 하나 가져오기
		request.setAttribute("notice", notice);
		request.setAttribute("cPage", request.getParameter("cPage"));
		return "board/onenotice.jsp";
	}

}
