package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.UsersVO;

public class AdminMemberSearchCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String searchCategory = request.getParameter("searchCategory");
		String searchText = request.getParameter("search_text");
		
		System.out.println(searchCategory+":"+searchText);
		
		Dao dao = new Dao();
		List<UsersVO> memberSearchVO = null;
		
		switch (searchCategory) {
		case "1": // id
			Map<String, String> map = new HashMap<>();
			map.put("category",searchCategory);
			map.put("id", searchText);
			memberSearchVO = dao.getMemberSearch(map);
			break;
		case "2": // 이름
			map = new HashMap<>();
			map.put("category",searchCategory);
			map.put("name", searchText);
			memberSearchVO = dao.getMemberSearch(map);
			break;
		case "3": // 주민번호
			map = new HashMap<>();
			map.put("category",searchCategory);
			map.put("jumin", searchText);
			memberSearchVO = dao.getMemberSearch(map);
			break;
		}
		
		request.setAttribute("memberSearchVO", memberSearchVO);
		return "/admin/menu1_memberList_search.jsp";
	}
/*	String name;
	
	public MemberSearchCommand(String name) {
		super();
		this.name = name;
	}
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		
		// users 정보
		UsersVO memberSearch = dao.getMemberSearch(name);		
		
		System.out.println(memberSearch.getName());
		
		request.setAttribute("memberSearch", memberSearch);
		
		return "admin/menu1_memberList.jsp";
	}*/

}
