package com.hb.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.StudyroomDAO;
import com.hb.mybatis.Studyroom_ReserveVO;

public class ReserveResultCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StudyroomDAO dao = new StudyroomDAO();
		Studyroom_ReserveVO tmp = (Studyroom_ReserveVO)request.getAttribute("rvo");
		String id = tmp.getId();
		String sr_date = tmp.getSr_date();
		String start_time = tmp.getStart_time();
		Studyroom_ReserveVO rvo = dao.getResult(tmp);
		request.setAttribute("result", rvo);
		return "/studyroom/reserveResult.jsp";
	}
}
