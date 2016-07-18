<%@page import="com.hb.mybatis.Book_rankVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
	<%
 	List<Book_rankVO> list = (List<Book_rankVO>) request.getAttribute("list");	
 	%>
	
	<jsp:include page="header.jsp" />
	<div class="rank">
		
	</div>
	<div>
		<table width="700">
			<thead>
				<tr align="left"></th>
				 <th width="250"></th>
				 <th width="150"></th>
			</tr>
			</thead>
			
			<tbody>
				<tr>
					<td colspan="3"><hr color="black" /><td>
				   </tr>
				   <c:forEach var="k" items="${list}">
				   	<tr>
				   <td>${k.RANK} </td>
				   <td>${k.ISBN}</td>
				   <td>${b_subject}</td>
				   </tr>
				   </c:forEach>
				   
				   <tr>
			
			</tbody>
				<td colspan="3"><hr/></td>
				</tr>
				
		</tbody>
		</table>
	</div>
	<br>


	</from>
</body>
</html>