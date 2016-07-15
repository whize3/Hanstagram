package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybatis.Book_DrawVO;
import com.hb.mybatis.Dao;
import com.hb.mybatis.UsersVO;

public class MemberOnelistCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		Dao dao = new Dao();
		
		// users 정보
		UsersVO uvo2 = dao.getMemberOnelist(id);		
		session.setAttribute("uvo2", uvo2);
		
		// 대출 정보
		List<Book_DrawVO> bdvo = dao.getBookDraw(id);
		session.setAttribute("bdvo", bdvo);
		
		// 예약 정보
		
		//
		
		return "menu1_memberList2.jsp";
	}

}
