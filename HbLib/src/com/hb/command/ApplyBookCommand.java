package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Book_ApplyVO;
import com.hb.mybatis.Dao;

public class ApplyBookCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		Book_ApplyVO bavo = new Book_ApplyVO();
		bavo.setS_url(request.getParameter("s_url"));
		bavo.setL_url(request.getParameter("l_url"));
		bavo.setB_subject(request.getParameter("title").replaceAll("<b>", "").replaceAll("</b>", ""));
		bavo.setCategory(request.getParameter("category"));
		bavo.setId(request.getParameter("id"));
		bavo.setISBN(request.getParameter("isbn"));
		bavo.setPublisher(request.getParameter("publisher").replaceAll("<b>", "").replaceAll("</b>", ""));
		bavo.setWriter(request.getParameter("author").replaceAll("<b>", "").replaceAll("</b>", ""));
		dao.bookApply(bavo);
		return null;
	}

}
