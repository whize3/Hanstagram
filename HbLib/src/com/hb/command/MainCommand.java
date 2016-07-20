package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.NoticeVO;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		List<NoticeVO> notice = dao.getNoticeList();
		System.out.println(notice.size());
		request.setAttribute("notice", notice);
		return "main.jsp";
	}
	
	
}
