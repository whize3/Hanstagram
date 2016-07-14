package com.hb.controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.command.BookSearchCom;
import com.hb.command.Command;




@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super(); 
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		System.out.println(type);
		
		// 도서검색
		Command comm = null;
		if(type.equals("all")){
			
		}else if(type.equals("search")) {
			comm = new BookSearchCom();
		}
	
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
