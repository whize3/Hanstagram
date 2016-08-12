package members;

import javax.servlet.http.HttpSession;

import org.apache.commons.vfs2.util.EncryptUtil;
import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import spring.project.db.MembersVO;



@Controller

public class MembersController {

	@Autowired

	MembersDAO mbDAO;

	private static final Logger log = LoggerFactory.getLogger(MembersController.class);
     /// 회원가입 폼 정보를 가지고 디비에 넣는 메소드
	@RequestMapping(value = "/members.do")

	public ModelAndView members(MembersVO vo, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		String USER_PWD  = EncryptUtil.encrypt(vo.getPwd());

		vo.setPwd(USER_PWD);

		mbDAO.insertMember(vo);

		mav.setViewName("redirect:/loginpage.do");

		log.info("insert시작함");

		return mav;

	}
	//아이디 중복 메소드

	@RequestMapping(value = "/overlaptest.do")

	@ResponseBody

	public String overlapTest(String member_id) {

		String count_Id = mbDAO.overlapTest(member_id);

		return count_Id;

	}

	@RequestMapping(value = "/membership.do")

	public String membership() {

		return "/members/members";

	}

	
	}

}
