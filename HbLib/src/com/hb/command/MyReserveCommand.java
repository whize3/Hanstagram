package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.MyDrawVO;

public class MyReserveCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		String id = request.getParameter("id");
		List<MyDrawVO> list = dao.getMyReserve(id);
		request.setAttribute("list", list);
		return "mylibrary/my_reserve.jsp";
	}
}
