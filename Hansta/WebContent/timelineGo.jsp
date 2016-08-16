<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
<%
String id = request.getParameter("fid");
System.out.println(id+"?!?!?!?");
response.sendRedirect("timeline.do?id="+id); %> --%>
<c:redirect url="timeline.do">
	<c:param name="id" value="${fid }"/>
</c:redirect>
<div id="result"></div>

</body>
</html>