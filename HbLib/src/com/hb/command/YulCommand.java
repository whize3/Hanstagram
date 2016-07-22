package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.YulVO;

public class YulCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		List<YulVO> yulvo = dao.getYul();
		request.setAttribute("yulvo", yulvo);
		return "service/yul.jsp";
	}

}
