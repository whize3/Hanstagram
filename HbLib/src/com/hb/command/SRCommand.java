package com.hb.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.StudyroomDAO;
import com.hb.mybatis.StudyroomVO;

public class SRCommand implements Command{
	private String date;
	public SRCommand() {
	}
	
	public SRCommand(String date) {
		super();
		this.date = date;
	}

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("SRCommand");
		StudyroomDAO sdao = new StudyroomDAO();
		List<StudyroomVO> list = null;
		if(date==null){
			list = sdao.allStudyRoom();
			request.setAttribute("room", list);
		}else{
			System.out.println(date);
			list = sdao.getTime(date);
			request.setAttribute("time", list);
		}
		return "/studyroom/studyRoomReserve.jsp";
	}
}
