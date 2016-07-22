package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.UsersVO;

public class ForgotPwdCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
			UsersVO input = new UsersVO();
			String pwd = "none";
			input.setId(request.getParameter("id"));
			input.setName(request.getParameter("name"));
			input.setJumin(request.getParameter("jumin"));
			Dao dao;
			UsersVO result;
			try {
				dao = new Dao();
				result = dao.forgotPwd(input);
				pwd = result.getPwd();
				System.out.println(pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return pwd;
	}

}
