package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.AdminVO;
import com.hb.mybatis.Dao;
import com.hb.mybatis.Paging;
import com.hb.mybatis.UsersVO;

public class MemberListCommand implements Command{

	/*@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		List<UsersVO> list = dao.getMemberList();
		request.setAttribute("memberlist", list);
		return "menu1_memberList.jsp";
	}*/
	
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Paging pvo = new Paging();
		Dao dao = new Dao();
		
		// list 臾댁“嫄� cPage 遺��꽣 諛쏄린
		// cPage�뒗 �쁽�옱 �럹�씠吏�濡� 蹂�寃�, null �씠硫� �쁽�옱�럹�씠吏�媛� 湲곕낯媛� 1�씠�맂�떎.
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		// �쟾泥� 寃뚯떆臾쇱쓽 �닔
		pvo.setTotalRecord(dao.memberTotalCount());
		pvo.setTotalPage();
		
		//  begin怨� end 援ы븯湲�
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
		
		// �썝湲� 由ъ뒪�듃 援ы븯湲�.
		List<UsersVO> list =  dao.getMemberList(map);
		request.setAttribute("a_memberlist", list);
		
		//  釉붾줉�쓽 �떆�옉踰덊샇 �걹踰덊샇 援ы븯湲�
		pvo.setBeginPage((int)((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
		 
		if(pvo.getEndPage() > pvo.getTotalPage()){
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		// list.jsp�뿉�꽌 �럹�씠吏� 泥섎━�븷�븣 �븘�슂�븯誘�濡�
		request.setAttribute("pvo", pvo);
	    request.setAttribute("cPage", cPage);
		
		return "admin/menu1_memberList.jsp";
	}
}
