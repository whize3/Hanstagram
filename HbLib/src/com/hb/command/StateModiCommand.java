package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.StudyroomDAO;

public class StateModiCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String sr_idx = request.getParameter("sr_idx");
		StudyroomDAO sdao = new StudyroomDAO();
		sdao.updateState(sr_idx);
		return "/Controller?type=admin_sdReserve";
	}
}
