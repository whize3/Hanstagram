package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.Paging;
import com.hb.mybatis.StudyroomDAO;
import com.hb.mybatis.Studyroom_ReserveVO;

public class Admin_sdReserveCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Paging pvo = new Paging();
		Studyroom_ReserveVO rvo = new Studyroom_ReserveVO();
		StudyroomDAO sdao = new StudyroomDAO();
		Dao pdao = new Dao();  
		
		sdao.updateTime();
		String cPage = request.getParameter("cPage");
		if(cPage=="") cPage="1";
		if(cPage != null){
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		
		pvo.setTotalRecord(pdao.noticeTotalCount());
		pvo.setTotalPage();
		
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		List<Studyroom_ReserveVO> list = sdao.getReserveList();
		request.setAttribute("reserveList", list);
		
		
		
		pvo.setBeginPage(((int)(pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
		
		if(pvo.getEndPage()>pvo.getTotalPage()){
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("cPage", cPage);
		
		
		return "admin/menu4_studyroom.jsp";
	}
}
