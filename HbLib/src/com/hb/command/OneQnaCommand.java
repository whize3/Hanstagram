package com.hb.command;


import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;

import com.hb.mybatis.Q_CommentVO;
import com.hb.mybatis.QnaVO;

public class OneQnaCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String q_idx = request.getParameter("q_idx");
		Dao dao = new Dao();
				
		//댓글 불러오기
		List<Q_CommentVO> qclist = dao.getQ_Comment(q_idx);
		
		//글 내용 가져오기
		QnaVO qna = dao.getOneQna(q_idx);
		
		//조회수 증가
		int hit = Integer.parseInt(qna.getQa_hit())+1;
		qna.setQa_hit(String.valueOf(hit));
		dao.qnaHit(qna);
		
		
		request.setAttribute("qclist", qclist);
		request.setAttribute("qna", qna);
		request.setAttribute("cPage", request.getParameter("cPage"));
		return "board/oneqna.jsp";
	}
	

}
