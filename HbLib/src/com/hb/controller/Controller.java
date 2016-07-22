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
import com.hb.command.BookComment;
import com.hb.command.BookListCommand;
import com.hb.command.Command;
import com.hb.command.DtCommand;
import com.hb.command.JoinCheckIdCommand;
import com.hb.command.LoginCommand;
import com.hb.command.LogoutCommand;
import com.hb.command.MainCommand;
import com.hb.command.MainSearchCommand;
import com.hb.command.RankBookCommand;
import com.hb.command.ReserveResultCommand;
import com.hb.command.ReserveRoomCommand;
import com.hb.command.SRCommand;
import com.hb.command.StateModiCommand;
import com.hb.command.MemberListCommand;
import com.hb.command.MemberOnelistCommand;
import com.hb.command.MyCommentCommand;
import com.hb.command.MyDrawCommand;
import com.hb.command.MyHistoryCommand;
import com.hb.command.MyInfoCommand;
import com.hb.command.MyInfoUpdateCommand;
import com.hb.command.MyReserveCommand;
import com.hb.command.NewBookCommand;
import com.hb.command.NoticeListCommand;
import com.hb.command.AdminNoticeAddCommand;
import com.hb.command.AdminNoticeListCommand;
import com.hb.command.Admin_sdReserveCommand;
import com.hb.command.OneNoticeCommand;
import com.hb.command.OneQnaCommand;
import com.hb.command.QCommentWriteCommand;
import com.hb.command.QnaDeleteCommand;
import com.hb.command.QnaListCommand;
import com.hb.command.QnaModifyCommand;
import com.hb.command.QnaWriteCommand;
import com.hb.command.UsersJoinCommand;
import com.hb.command.YulCommand;
import com.hb.mybatis.MyDrawVO;
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
			System.out.println(request.getParameter("pwd")+request.getParameter("change")+request.getParameter("id"));
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
			comm = new AdminNoticeListCommand();
		}else if(type.equals("a_NoticeAdd")){
			comm = new AdminNoticeAddCommand();
		}else if(type.equals("logout")){
			comm = new LogoutCommand();
			path = comm.exec(request, response);
			out.print(path);
			return;
		}else if(type.equals("applylist")){
			comm = new ApplyListCommand();
		}else if(type.equals("yul")){
			comm = new YulCommand();
		}else if(type.equals("selectone")){
			comm = new DtCommand();
		}else if(type.equals("getRoom")){
			if(request.getParameter("date")==null){
				comm = new SRCommand();
			}else{
				System.out.println(request.getParameter("date")+"111");
				comm = new SRCommand(request.getParameter("date"));
			}
		}else if(type.equals("roomReserve")){
			comm = new ReserveRoomCommand();			
		}else if(type.equals("strSuc")){
			comm = new ReserveResultCommand();
		}else if(type.equals("bookcomment")){
			comm = new BookComment();
		}else if(type.equals("main")){
			comm = new MainCommand();
		}else if(type.equals("onenotice")){
			comm = new OneNoticeCommand();
		}else if(type.equals("noticelist")){
			comm = new NoticeListCommand();
		}else if(type.equals("qnalist")){
			comm = new QnaListCommand();
		}else if(type.equals("oneqna")){
			comm = new OneQnaCommand();
		}else if(type.equals("qnamodify")){
			comm = new QnaModifyCommand();
		}else if(type.equals("qnadelete")){
			comm = new QnaDeleteCommand();
		}else if(type.equals("qnawrite")){
			comm = new QnaWriteCommand();
		}else if(type.equals("newbook")){
			comm = new NewBookCommand();
		}else if(type.equals("writeqcomment")){
			comm = new QCommentWriteCommand();
		}else if(type.equals("admin_sdReserve")){
			comm = new Admin_sdReserveCommand();
		}else if(type.equals("stateModi")){
			comm = new StateModiCommand();
		}else if(type.equals("mainsearch")){
			comm = new MainSearchCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
