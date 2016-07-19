package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Book_ApplyVO;
import com.hb.mybatis.Dao;

public class ApplyListCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Dao dao = new Dao();
		List<Book_ApplyVO> list = dao.getBookApply(id);
		request.setAttribute("list", list);
		return "/service/ser_apply_list.jsp";
	}
}
