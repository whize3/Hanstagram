package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.MyDrawVO;

public class MyCommentCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		String id = request.getParameter("id");
		List<MyDrawVO> list = dao.getMyComment(id);
		String bc_cnt = dao.getMyCommentCnt(id);
		request.setAttribute("list", list);
		request.setAttribute("bc_cnt", bc_cnt);
		return "mylibrary/my_comment.jsp";
	}
}
