package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.UsersVO;

public class ForgotIdCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
			UsersVO input = new UsersVO();
			Dao dao;
			UsersVO result;
			String id="none";
			input.setName(request.getParameter("name"));
			input.setJumin(request.getParameter("jumin"));
			try {
				dao = new Dao();
				result = dao.forgotId(input);
				id = result.getId();
			} catch (Exception e) {
				
			}
	
		return id;
	}

}
