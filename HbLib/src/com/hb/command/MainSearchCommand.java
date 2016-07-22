package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.B_CommentVO;
import com.hb.mybatis.BookVO;
import com.hb.mybatis.Dao;

public class MainSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		String keyword = request.getParameter("keyword");
		String option = request.getParameter("option");
		Map<String, String> map = new HashMap<>();
		map.put("option", option);
		map.put("keyword", keyword);
		List<BookVO> list = dao.getMainSearch(map);
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		request.setAttribute("option", option);
		return "mainsearch.jsp";
	}

}
