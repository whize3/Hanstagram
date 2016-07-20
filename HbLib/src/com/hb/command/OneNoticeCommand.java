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
		NoticeVO notice = dao.getOneNotice(n_idx);
		request.setAttribute("notice", notice);
		return "board/onenotice.jsp";
	}

}
