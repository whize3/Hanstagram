package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Book_ApplyVO;
import com.hb.mybatis.Dao;

public class AdminApplyRefuseCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String refuse = request.getParameter("refuse");
		String ba_idx = request.getParameter("ba_idx");
		
		Dao dao = new Dao();
		
		Book_ApplyVO bavo = new Book_ApplyVO();
		bavo.setRefuse_reason(refuse);
		bavo.setBa_idx(ba_idx);
		
		dao.updateRefuse(bavo);

		
		return "Controller?type=a_applyBookList";
	}

}
