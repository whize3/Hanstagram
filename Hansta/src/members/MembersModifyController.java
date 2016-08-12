package members;

import javax.servlet.http.HttpSession;




import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import spring.project.db.MembersVO;

@Controller

public class MembersModifyController {

	@Autowired

	MembersDAO mbDAO;
	@RequestMapping(value = "/membersmodify.do" )		

	public ModelAndView members(HttpSession session){
		ModelAndView mav = new ModelAndView();
		String member_id = (String)session.getAttribute("id");
		if ( member_id == null) {		//session check
			mav.setViewName("");
			return mav;
		}
		mav.addObject("id",member_id);
		mav.addObject("member_info", mbDAO.getMemberInfo(member_id));
		mav.setViewName("/members/members_modify");
		return mav;

	}
	
	@RequestMapping(value="/member_modify.do")		//개인정보수정

	@ResponseBody

	public String modify(MembersVO VO, HttpSession session){

		String member_id = (String)session.getAttribute("id");
		VO.setId(member_id);
		mbDAO.updateMember(VO);

		String end = "수정이 완료되었습니다.";

		return end;

	}
}
