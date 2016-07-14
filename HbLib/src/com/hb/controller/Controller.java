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
import com.hb.command.LoginCommand;



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
		String type = request.getParameter("type");
		System.out.println(type);
		Command comm = null;
		if(type.equals("applybook")){
			comm = new ApplyBookCommand();
		}else if(type.equals("login")){
			comm = new LoginCommand();
		}
		String result = comm.exec(request, response);
		request.getRequestDispatcher(result).forward(request, response);
	}

}
