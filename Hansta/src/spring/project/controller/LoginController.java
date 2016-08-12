package spring.project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import login_service.LoginService;
import spring.project.db.Dao;
@Controller
public class LoginController {
	@Autowired
	LoginService loginService;
	Dao dao;
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	@RequestMapping(value = "/login.do")
	@ResponseBody
	public int login(String id, String pw, HttpSession session){
		HashMap<String, String> hstParam = new HashMap<String, String>();
		hstParam.put("member_id", id);
		hstParam.put("member_password", pw);
		int loginIdentify = loginService.loginCheck(hstParam);
		if (loginIdentify == 1){
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
		}
		return loginIdentify;
	}
	@RequestMapping(value = "/loginpage.do")
	public ModelAndView loginpage(HttpSession session){

		ModelAndView mav = new ModelAndView();

		String member_id = (String)session.getAttribute("id");
		if ( member_id != null) {		//session check
			mav.setViewName("redirect:/main.do");
			return mav;

		}
		mav.setViewName("/login/loginpage");
		return mav;

	}

}
