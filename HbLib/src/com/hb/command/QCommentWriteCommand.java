package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.Q_CommentVO;

public class QCommentWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		Dao dao = new Dao();
		String q_idx = request.getParameter("q_idx");
		Q_CommentVO qcvo = new Q_CommentVO();
		qcvo.setId(request.getParameter("id"));
		qcvo.setQ_idx(q_idx);
		qcvo.setQc_content(request.getParameter("qc_content"));
		dao.writeQComment(qcvo);
		
		
		return "Controller?type=oneqna&q_idx="+q_idx;
	}

}
