package com.hb.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	public String exec(HttpServletRequest request, HttpServletResponse response);

	
	
}
