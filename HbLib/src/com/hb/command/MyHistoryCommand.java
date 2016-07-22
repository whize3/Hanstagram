package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.MyDrawVO;
import com.hb.mybatis.paging_history;

public class MyHistoryCommand implements Command{
	static paging_history pvo = null;
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		String id = request.getParameter("id");
		pvo = new paging_history();
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		// 전체 게시물의 수
		pvo.setTotalRecord(dao.historytotalCount(id));
		pvo.setTotalPage();
		//  begin과 end 구하기
		// begin = (nowPage-1) * numPerPage + 1;
		// end = (begin - 1) + numPerPage;
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		Map<Object, Object> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		map.put("id", id);
		List<MyDrawVO> list = dao.getMyHistory(map);
		request.setAttribute("list", list);
		
		
		 pvo.setBeginPage((int)((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		 pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
		 
		 if(pvo.getEndPage() > pvo.getTotalPage()){
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		// list.jsp에서 페이징 처리할때 필요하므로
		 request.setAttribute("pvo", pvo);
	     request.setAttribute("cPage", cPage);
		return "mylibrary/my_history.jsp";
	}

}
