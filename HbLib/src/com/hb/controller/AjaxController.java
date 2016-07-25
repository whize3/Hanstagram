package com.hb.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.command.AdminBookAddCommand;
import com.hb.command.ApplyBookCommand;
import com.hb.command.BookSearchCom;
import com.hb.command.Command;
import com.hb.command.ForgotIdCommand;
import com.hb.command.ForgotPwdCommand;
import com.hb.command.LoginCommand;
import com.hb.command.LogoutCommand;
import com.hb.command.SRCommand2;

@WebServlet("/AjaxController")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxController() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		System.out.println("type: "+type);
		Command comm = null;
		if(type.equals("applybook")){
			comm = new ApplyBookCommand();
		}else if(type.equals("login")){
			comm = new LoginCommand();
		}else if(type.equals("search")){
			comm = new BookSearchCom();
		}else if(type.equals("logout")){
			comm = new LogoutCommand();
		}else if(type.equals("forgotid")){
			comm = new ForgotIdCommand();
		}else if(type.equals("forgotpwd")){
			comm = new ForgotPwdCommand();
		}else if(type.equals("getRoom")){
			comm = new SRCommand2();
		}else if(type.equals("a_bookAdd")){
			comm = new AdminBookAddCommand();
		}
		String result = comm.exec(request, response);
		System.out.println(result);
		out.print(result);
	}

}
