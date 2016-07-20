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
		request.setAttribute("qna", qna);
		return "board/oneqna.jsp";
	}
	

}
