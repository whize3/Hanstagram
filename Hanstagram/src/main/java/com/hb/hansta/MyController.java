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
		
		// list ������ cPage ���� �ޱ�
		// cPage�� ���� �������� ����, null �̸� ������������ �⺻�� 1�̵ȴ�.
		String cPage = request.getParameter("cPage");
		if(cPage != null){
			page.setNowPage(Integer.parseInt(cPage));
		}
		// ��ü �Խù��� ��
		page.setTotalRecord(Dao.totalCount());
		page.setTotalPage();
		
		//  begin�� end ���ϱ�
		// begin = (nowPage-1) * numPerPage + 1;
		// end = (begin - 1) + numPerPage;
		page.setBegin((page.getNowPage()-1)*page.getNumPerPage()+1);
		page.setEnd((page.getBegin()-1)+page.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", page.getBegin());
		map.put("end", page.getEnd());
		
		List<BbsVO> list =  dao.getList(map);
		mv.addObject("list", list);
		
		//  ����� ���۹�ȣ ����ȣ ���ϱ�
		// int beginPage = (int)((nowPage-1)/pagePerBlock)*pagePerBlock+1 ;  
		// int endPage = beginPage + pagePerBlock -1 ;
		// ���ǻ��� : endPage�� totalPage���� Ŭ�� �ִ�.
		// if(endPage> totalPage)   endPage = totalPage;
		 page.setBeginPage((int)((page.getNowPage()-1)/page.getPagePerBlock())*page.getPagePerBlock()+1);
		 page.setEndPage(page.getBeginPage() + page.getPagePerBlock()-1);
		 
		 if(page.getEndPage() > page.getTotalPage()){
			page.setEndPage(page.getTotalPage());
		}
		
		// list.jsp���� ����¡ ó���Ҷ� �ʿ��ϹǷ�
		 mv.addObject("page", page);
		 mv.addObject("cPage", cPage);
		
	     return mv;
	}*/
}
