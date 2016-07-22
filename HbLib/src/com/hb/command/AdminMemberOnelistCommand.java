package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hb.mybatis.BookDraw_memberVO;
import com.hb.mybatis.Book_DrawVO;
import com.hb.mybatis.Dao;
import com.hb.mybatis.UsersVO;

public class AdminMemberOnelistCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		HttpSession session = request.getSession();
		Dao dao = new Dao();
		
		// users 정보
		UsersVO uvo2 = dao.getMemberOnelist(id);		
		session.setAttribute("uvo2", uvo2);
		
		// 대출 정보
		List<BookDraw_memberVO> bdvo = dao.getBookDraw(id);
		request.setAttribute("bdvo", bdvo);
		/*session.setAttribute("bdvo", bdvo);*/
		
		// 예약 정보
		List<BookDraw_memberVO> reserveList = dao.getBookReserve(id);
		request.setAttribute("reserveList", reserveList);
		
		
		return "admin/menu1_memberList2.jsp";
	}

}
