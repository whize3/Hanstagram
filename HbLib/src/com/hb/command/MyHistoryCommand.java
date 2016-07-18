package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.MyDrawVO;

public class MyHistoryCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		String id = request.getParameter("id");
		List<MyDrawVO> list = dao.getMyHistory(id);
		request.setAttribute("list", list);
		return "mylibrary/my_history.jsp";
	}

}
