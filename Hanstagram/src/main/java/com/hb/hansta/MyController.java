package com.hb.hansta;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.hb.db.Dao;


@org.springframework.stereotype.Controller
public class MyController   {
	private Dao dao;
	public Dao getDao() {return dao;}
	public void setDao(Dao dao) {	this.dao = dao;	}
	
	@RequestMapping("/test.do")
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("home");
		
		return mv;
	}
	
	
	/*@RequestMapping("/list.do")
	public ModelAndView getList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("list");
		page = new Pageing();
		
		// list 무조건 cPage 부터 받기
		// cPage는 현재 페이지롤 변경, null 이면 현재페이지가 기본값 1이된다.
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			page.setNowPage(Integer.parseInt(cPage));
		}
		// 전체 게시물의 수
		page.setTotalRecord(Dao.totalCount());
		page.setTotalPage();
		
		//  begin과 end 구하기
		// begin = (nowPage-1) * numPerPage + 1;
		// end = (begin - 1) + numPerPage;
		page.setBegin((page.getNowPage()-1)*page.getNumPerPage()+1);
		page.setEnd((page.getBegin()-1)+page.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", page.getBegin());
		map.put("end", page.getEnd());
		
		List<BbsVO> list =  dao.getList(map);
		mv.addObject("list", list);
		
		//  블록의 시작번호 끝번호 구하기
		// int beginPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1 ;  
		// int endPage = beginPage + pagePerBlock -1 ;
		// 주의사항 : endPage가 totalPage보다 클수 있다.
		// if(endPage> totalPage)   endPage = totalPage;
		 page.setBeginPage((int)((page.getNowPage()-1)/page.getPagePerBlock())*page.getPagePerBlock()+1);
		 page.setEndPage(page.getBeginPage() + page.getPagePerBlock()-1);
		 
		 if(page.getEndPage() > page.getTotalPage()){
			page.setEndPage(page.getTotalPage());
		}
		
		// list.jsp에서 페이징 처리할때 필요하므로
		 mv.addObject("page", page);
		 mv.addObject("cPage", cPage);
		
	     return mv;
	}*/
}
