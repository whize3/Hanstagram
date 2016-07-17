package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.hb.mybatis.Dao;
import com.hb.mybatis.AdminVO;

public class AdminLoginCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		AdminVO avo = new AdminVO();
		avo.setId(id);
		avo.setPwd(pwd);
		
		Dao dao = new Dao();
		AdminVO admin = dao.getAdminList(avo);
		if(admin!=null){
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			return "admin/main.jsp";
		}else{
			return "admin/login_fail.jsp";
		}		
				
	}
	
}
