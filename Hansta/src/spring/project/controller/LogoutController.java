package spring.project.controller;

import java.text.SimpleDateFormat;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LogoutController {

	private static final Logger log = LoggerFactory.getLogger(LogoutController.class);

	@RequestMapping(value = "/logout.do")

	public String logout(HttpSession session) {

		String curTime = new SimpleDateFormat("yyyy/MM/dd/HH:mm").format(new Date());

		log.info("logout 현재시간 : " + curTime);

		session.invalidate(); // session 종료(안에있는 데이터 다삭제)

		return "redirect:/loginpage.do";

	}
	@RequestMapping(value = "/logoutpage.do")

	public String loginpage() {
		return "/login/loginpage";
	}

}
