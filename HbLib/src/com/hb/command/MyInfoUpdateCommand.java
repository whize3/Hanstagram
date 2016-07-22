package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;

public class MyInfoUpdateCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String pathgo=null;
		Dao dao = new Dao();
		if(request.getParameter("change").equals("change_pwd")){
			System.out.println(request.getParameter("change")+request.getParameter("pwd"));
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			Map<String , String> map = new HashMap<>();
			map.put("changetype", "change_pwd");
			map.put("id", id);
			map.put("pwd", pwd);
			dao.getMyInfoUpdate(map);
			pathgo="/Controller?type=myinfo&id="+id;
		}else if(request.getParameter("change").equals("change_email")){
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			Map<String , String> map = new HashMap<>();
			map.put("changetype", "change_email");
			map.put("id", id);
			map.put("email", email);
			dao.getMyInfoUpdate(map);
			pathgo="/Controller?type=myinfo&id="+id;
		}else if(request.getParameter("change").equals("change_tel")){
			String id = request.getParameter("id");
			String tel = request.getParameter("tel");
			Map<String , String> map = new HashMap<>();
			map.put("changetype", "change_tel");
			map.put("id", id);
			map.put("tel", tel);
			dao.getMyInfoUpdate(map);
			pathgo="/Controller?type=myinfo&id="+id;
		}
		
		return pathgo;
	}

}
