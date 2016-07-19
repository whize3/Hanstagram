package com.hb.controller;

import java.io.IOException;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.command.AdminLoginCommand;
import com.hb.command.ApplyBookCommand;
import com.hb.command.ApplyListCommand;
import com.hb.command.BookAddCommand;
import com.hb.command.BookListCommand;
import com.hb.command.Command;
import com.hb.command.DtCommand;
import com.hb.command.JoinCheckIdCommand;
import com.hb.command.LoginCommand;
import com.hb.command.LogoutCommand;
import com.hb.command.RankBookCommand;
import com.hb.command.ReserveRoomCommand;
import com.hb.command.SRCommand;
import com.hb.command.MemberListCommand;
import com.hb.command.MemberOnelistCommand;
import com.hb.command.MyCommentCommand;
import com.hb.command.MyDrawCommand;
import com.hb.command.MyHistoryCommand;
import com.hb.command.MyInfoCommand;
import com.hb.command.MyInfoUpdateCommand;
import com.hb.command.MyReserveCommand;
import com.hb.command.NoticeAddCommand;
import com.hb.command.NoticeListCommand;
import com.hb.command.UsersJoinCommand;
import com.hb.mybatis.MyDrawVO;
import com.hb.command.BookSearchCom;



//select count(b_num),b_num from book_draw where bd_date >= sysdate-15 group by b_num;
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
		String path = null;
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
		}else if(type.equals("rank")){
			comm = new RankBookCommand();
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
		}else if(type.equals("adminLogin")){
			comm = new AdminLoginCommand();
		}else if(type.equals("a_memberlist")){
			comm = new MemberListCommand();			
		}else if(type.equals("a_memberOnelist")){
			comm = new MemberOnelistCommand();		
		}else if(type.equals("a_booklist")){
			comm = new BookListCommand();
		}else if(type.equals("a_bookAdd")){
			comm = new BookAddCommand();
		}else if(type.equals("a_noticeList")){
			comm = new NoticeListCommand();
		}else if(type.equals("a_NoticeAdd")){
			comm = new NoticeAddCommand();
		}else if(type.equals("logout")){
			comm = new LogoutCommand();
			path = comm.exec(request, response);
			out.print(path);
			return;
		}else if(type.equals("applylist")){
			comm = new ApplyListCommand();

		}else if(type.equals("selectone")){
			comm = new DtCommand();

		}else if(type.equals("getRoom")){
			if(request.getParameter("date")==null){
				comm = new SRCommand();
			}else{
				System.out.println(request.getParameter("date"));
				comm = new SRCommand(request.getParameter("date"));
			}
		}else if(type.equals("roomReserve")){
			comm = new ReserveRoomCommand();			
		}else if(type.equals("strSuc")){
			comm = new SRCommand();

		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
