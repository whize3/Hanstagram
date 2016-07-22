package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BookVO;
import com.hb.mybatis.Dao;

public class AdminBookAddCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		/*String chk = request.getParameter("type");
		String b_num = request.getParameter("b_num");
		String b_subject = request.getParameter("b_subject");
		String b_location = request.getParameter("b_location");
		String publisher = request.getParameter("publisher");
		String writer = request.getParameter("writer");
		String category = request.getParameter("category");
		String isbn = request.getParameter("isbn");
		String img_url = request.getParameter("img_url");
		
		if(chk==null){
			return "admin/menu2_bookList_add.jsp";
		}else{
			BookVO bvo = new BookVO();
			bvo.setB_num(b_num);
			bvo.setB_subject(b_subject);
			bvo.setB_location(b_location);
			bvo.setPublisher(publisher);
			bvo.setWriter(writer);
			bvo.setCategory(category);
			bvo.setISBN(isbn);
			bvo.setImg_url(img_url);
			
			Dao dao = new Dao();
			dao.getBookAdd(bvo);
			return "admin/menu2_bookList.jsp";
		}*/
		String b_subject = request.getParameter("title").replaceAll("<b>", "").replaceAll("</b>", "");
		String b_location = request.getParameter("b_location");
		String publisher = request.getParameter("publisher").replaceAll("<b>", "").replaceAll("</b>", "");
		String writer = request.getParameter("author").replaceAll("<b>", "").replaceAll("</b>", "");
		String category = request.getParameter("category").replaceAll("<b>", "").replaceAll("</b>", "");
		String isbn = request.getParameter("isbn");
		String s_url = request.getParameter("s_url");
		String l_url = request.getParameter("l_url");
		System.out.println(b_location+"dd"+l_url);
		Dao dao = new Dao();
		BookVO bvo = new BookVO();
		bvo.setB_subject(b_subject);
		bvo.setB_location(b_location);
		bvo.setPublisher(publisher);
		bvo.setWriter(writer);
		bvo.setCategory(category);
		bvo.setIsbn(isbn);
		bvo.setS_url(s_url);
		bvo.setL_url(l_url);
		
		dao.addBook(bvo);
		
		return "/HbLib/Controller?type=a_booklist";
	
	}
}
