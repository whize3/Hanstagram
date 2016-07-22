package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.NoticeVO;
import com.hb.mybatis.Paging;

public class AdminNoticeListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Paging pvo = new Paging();
		Dao dao = new Dao();
		
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		
		// �쟾泥� 寃뚯떆臾�
		pvo.setTotalRecord(dao.noticeTotalCount());
		pvo.setTotalPage();
		
		// begin 怨� end 援ы븯湲�
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		System.out.println(pvo.getBegin()+"&"+pvo.getEnd());
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		// �썝湲� 由ъ뒪�듃 援ы븯湲�
		List<NoticeVO> list = dao.getNoticeList(map);
		System.out.println("dd");
		request.setAttribute("a_noticeList", list);
		
		// 釉붾줉�쓽 �떆�옉踰덊샇 �걹踰덊샇 援ы븯湲�
		pvo.setBeginPage(((int)(pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
		
		if(pvo.getEndPage()>pvo.getTotalPage()){
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("cPage", cPage);
		
		return "admin/menu3_board_Notice.jsp";
	}

}
