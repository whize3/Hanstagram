package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.UsersVO;

public class UsersJoinCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		String gender = null;
		String birthdayMonth = null;
		String birthdayDay = null;
		UsersVO usersVO = new UsersVO();
		usersVO.setId(request.getParameter("id"));
		usersVO.setName(request.getParameter("name"));
		usersVO.setPwd(request.getParameter("pwd"));
		if(((request.getParameter("birthdayYear")).substring(0,2)).equals("20") || request.getParameter("gender") == "1"){
			gender = "3";
		}else if(((request.getParameter("birthdayYear")).substring(0,2)).equals("20") || request.getParameter("gender") == "2"){
			gender = "4";
		}else{
			gender = request.getParameter("gender");
		}
		if((request.getParameter("birthdayMonth")).length()==1){
			birthdayMonth ="0"+request.getParameter("birthdayMonth");
		}else{
			birthdayMonth = request.getParameter("birthdayMonth");
		}
		if((request.getParameter("birthdayDay")).length()==1){
			birthdayDay = "0" + request.getParameter("birthdayDay");
		}else{
			birthdayDay = request.getParameter("birthdayDay");
		}
		usersVO.setJumin((request.getParameter("birthdayYear").substring(2,4))+birthdayMonth+birthdayDay+"-"+gender);
		usersVO.setEmail(request.getParameter("email_1")+"@"+request.getParameter("email_2"));
		usersVO.setTel(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));
		usersVO.setAddr(request.getParameter("addr"));
		dao.UsersJoin(usersVO);
		return "join.jsp";
	}

}
