package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.NoticeVO;
import com.hb.mybatis.QnaVO;

public class OneQnaCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String q_idx = request.getParameter("q_idx");
		Dao dao = new Dao();
			
		QnaVO qna = dao.getOneQna(q_idx);
		
		int hit = Integer.parseInt(qna.getQa_hit())+1;
		qna.setQa_hit(String.valueOf(hit));
		dao.qnaHit(qna);
		
		request.setAttribute("qna", qna);
		request.setAttribute("cPage", request.getParameter("cPage"));
		return "board/oneqna.jsp";
	}
	

}
