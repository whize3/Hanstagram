package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Book_rankVO;
import com.hb.mybatis.Dao;

public class RankBookCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		List<Book_rankVO> list = dao.ranking();
		for (Book_rankVO k : list) {
			System.out.println(k.getRank());
		}
		request.setAttribute("list", list);
		
		return "search/rank_searchlist.jsp";
	}

}
