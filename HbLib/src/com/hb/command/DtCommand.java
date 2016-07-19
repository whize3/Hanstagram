package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BookVO;
import com.hb.mybatis.Dao;

public class DtCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		BookVO vo = new BookVO();
		Dao dao = new Dao();
		vo = dao.detisearch(request.getParameter("b_num"));
		request.setAttribute("vo", vo);
		return "search/book_deti.jsp";
	}

}
