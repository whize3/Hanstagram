package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.NoticeVO;

public class AdminNoticeAddCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		/*String chk = request.getParameter("chk");
		String n_subject = request.getParameter("n_subject");
		String n_content = request.getParameter("n_content");
	
		System.out.println(chk);
		System.out.println(n_subject);
		System.out.println(n_content);
		if(chk==null){
			return "menu3_board_Notice_add.jsp";
		}else{
			NoticeVO nvo = new NoticeVO();
			nvo.setN_subject(n_subject);
			nvo.setN_content(n_content);
			
			Dao dao = new Dao();
			dao.getNoticeAdd(nvo);
			return "menu3_board_Notice.jsp";
		}*/
		System.out.println("ddddddddd");
		String n_subject = request.getParameter("n_subject");
		String n_content = request.getParameter("n_content");
		
		System.out.println(n_subject);
		System.out.println(n_content);
		
		NoticeVO nvo = new NoticeVO();
		nvo.setN_subject(n_subject);
		nvo.setN_content(n_content);
		
		Dao dao = new Dao();
		dao.getNoticeAdd(nvo);
		return "Controller?type=a_noticeList";
	}

}
