package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.QnaVO;

public class QnaModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String q_idx = request.getParameter("q_idx");
		QnaVO qvo = new QnaVO();
		Dao dao = new Dao();
		qvo.setQ_idx(q_idx);
		qvo.setQa_subject(request.getParameter("qa_subject"));
		qvo.setQa_content(request.getParameter("qa_content"));
		dao.moidfyQna(qvo);
		
				
		return "Controller?type=oneqna&q_idx"+q_idx;
	}

}
