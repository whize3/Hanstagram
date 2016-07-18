package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybatis.Dao;
import com.hb.mybatis.UsersVO;

public class LoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		Dao dao =  new Dao();
		UsersVO user = dao.login(id, pwd);
		String result=null;
		if(user!=null){
			result = "index.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
		}else {
			result = "fail";
		}
		
		return result;		
	}

}
