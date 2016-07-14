package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BookVO;
import com.hb.mybatis.Dao;

public class BookSearchCom implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String b_num  = request.getParameter("b_num");
		String search_all = request.getParameter("search_all");
		String path = null;
		
		if(b_num==null){
			path = "search_all.jsp";
		}else{
			Dao dao  = new Dao();
			List<BookVO> list = dao.search(b_num,search_all);
			request.setAttribute("booklist", list);
			path = "searchall_result.jsp";
		}
		
		return null;
	}

}
