package com.hb.command;

import java.awt.print.Book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BookVO;
import com.hb.mybatis.Book_ApplyVO;
import com.hb.mybatis.Dao;

public class AdminApplyOkCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String ba_idx = request.getParameter("ba_idx");
		String b_num = request.getParameter("b_num");
		String location = request.getParameter("location");
		System.out.println("Dddd");
		System.out.println(ba_idx+".."+location);
		
		Dao dao = new Dao();
		// 책 정보 가져오기
		Book_ApplyVO bavo = new Book_ApplyVO();
		bavo = dao.getApplyOneList(ba_idx);
		dao.getApplyState(ba_idx);
		String s_url = bavo.getS_url();
		String l_url = bavo.getL_url();
		if(s_url==null){
			s_url="";					
		}
		if(l_url==null){
			l_url="";					
		}
		// 책 정보 추가하기
		
		BookVO bookAdd = new BookVO();
		bookAdd.setB_num(b_num);
		bookAdd.setB_subject(bavo.getB_subject());
		bookAdd.setB_location(location);
		bookAdd.setPublisher(bavo.getPublisher());
		bookAdd.setWriter(bavo.getWriter());
		bookAdd.setCategory(bavo.getCategory());
		bookAdd.setIsbn(bavo.getIsbn());
		bookAdd.setS_url(s_url);
		bookAdd.setL_url(l_url);
		dao.bookApplyAdd(bookAdd);
		
		
		
		
		return "Controller?type=a_booklist";
	}

}
