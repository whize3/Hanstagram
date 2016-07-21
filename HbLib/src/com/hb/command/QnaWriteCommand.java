package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.QnaVO;

public class QnaWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		QnaVO qvo = new QnaVO();
		qvo.setQa_subject(request.getParameter("qa_subject"));
		qvo.setQa_content(request.getParameter("qa_content"));
		qvo.setId(request.getParameter("id"));
				
		Dao dao = new Dao();
		
		dao.writeQna(qvo);
		return "Controller?type=qnalist";
	}
	
}
