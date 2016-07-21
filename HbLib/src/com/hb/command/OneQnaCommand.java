package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.Paging;
import com.hb.mybatis.Q_CommentVO;
import com.hb.mybatis.QnaVO;

public class OneQnaCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String q_idx = request.getParameter("q_idx");
		Dao dao = new Dao();
		
		//댓글 페이징
		Paging pvo = new Paging();
		String qPage = request.getParameter("qPage");
		
		if(qPage != null){
			pvo.setNowPage(Integer.parseInt(qPage));
		}
		
		pvo.setTotalRecord(dao.qnaTotalCount());
		pvo.setTotalPage();
		
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		map.put("q_idx", Integer.parseInt(q_idx));
		
		//댓글 불러오기
		List<Q_CommentVO> qclist = dao.getQ_Comment(map);
		
		//글 내용 가져오기
		QnaVO qna = dao.getOneQna(q_idx);
		
		//조회수 증가
		int hit = Integer.parseInt(qna.getQa_hit())+1;
		qna.setQa_hit(String.valueOf(hit));
		dao.qnaHit(qna);
		
		request.setAttribute("qPage", qPage);
		request.setAttribute("qclist", qclist);
		request.setAttribute("qna", qna);
		request.setAttribute("cPage", request.getParameter("cPage"));
		return "board/oneqna.jsp";
	}
	

}
