package com.hb.controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.hb.command.ApplyBookCommand;
import com.hb.command.Command;
import com.hb.command.JoinCheckIdCommand;
import com.hb.command.LoginCommand;
import com.hb.command.MyCommentCommand;
import com.hb.command.MyDrawCommand;
import com.hb.command.MyHistoryCommand;
import com.hb.command.MyInfoCommand;
import com.hb.command.MyInfoUpdateCommand;
import com.hb.command.MyReserveCommand;
import com.hb.command.UsersJoinCommand;
import com.hb.command.BookSearchCom;




@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
         
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("컨트롤러진입");
		String type = request.getParameter("type");
		System.out.println("type: "+type);
		Command comm = null;
		if(type.equals("applybook")){
			comm = new ApplyBookCommand();
		}else if(type.equals("login")){
			comm = new LoginCommand();
		}else if(type.equals("all")){
			
		}else if(type.equals("search")){
			comm = new BookSearchCom();
		}else if(type.equals("draw")){
			comm = new MyDrawCommand();
		}else if(type.equals("reserve")){
			comm = new MyReserveCommand();
		}else if(type.equals("history")){
			comm = new MyHistoryCommand();
		}else if(type.equals("comment")){
			comm = new MyCommentCommand();
		}else if(type.equals("myinfo")){
			comm = new MyInfoCommand();
		}else if(type.equals("myupdate")){
			comm = new MyInfoUpdateCommand();
		}else if(type.equals("chkid")){
			comm = new JoinCheckIdCommand();
			String result = comm.exec(request, response);
			out.println(result);
			return;
		}else if(type.equals("join")){
			comm = new UsersJoinCommand();
		}
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
