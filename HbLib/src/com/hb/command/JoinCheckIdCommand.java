package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;

public class JoinCheckIdCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Dao dao = new Dao();
		String result = dao.getJoinCheckId(id);
		return result;
	}

}
