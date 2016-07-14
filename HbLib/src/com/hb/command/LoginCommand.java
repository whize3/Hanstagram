package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id);
		return null;
	}

}
