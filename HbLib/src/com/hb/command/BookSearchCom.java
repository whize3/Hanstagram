package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BookVO;
import com.hb.mybatis.Dao;

public class BookSearchCom implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
	    String idx = request.getParameter("idx");
	    String keyword = request.getParameter("keyword");
	    /*String desearch = request.getParameter("desearch");*/
		String path = null;
		
		if(idx==null){
			path = "search/searchall_result.jsp";
		}else{
			Dao dao  = new Dao();
			List<BookVO> list = dao.search(idx,keyword)/*(booksearch keyword,desearch)*/;
			request.setAttribute("booklist", list);
			path = "search/searchall_result.jsp";
		}
		
		return path;
	}

}
