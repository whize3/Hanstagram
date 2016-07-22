package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BookVO;
import com.hb.mybatis.Dao;

public class NewBookCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		List<BookVO> list = dao.getNewBook();
		
		request.setAttribute("list", list);
		
		return "search/newbook.jsp";
	}

}
